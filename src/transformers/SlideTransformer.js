import Transformer from "./Transformer";
import { applyEdgeBehavior } from "./EdgeBehavior";

export const ANCHOR = Object.freeze({
  MIN: "min",
  MIDPOINT: "mid",
  MAX: "max",
});

class SlidablePropertyMetadata {
  constructor(defaultRange) {
    this.range = defaultRange;
    this.min = 0;
    this.midpoint = 0;
    this.max = 0;
  }
}

class SlidablePropertiesMetadata {
  constructor() {
    this.start = new SlidablePropertyMetadata(1);
    this.pitch = new SlidablePropertyMetadata(12);
    this.velocity = new SlidablePropertyMetadata(64);
    this.duration = new SlidablePropertyMetadata(1);
    this.strum = new SlidablePropertyMetadata(1);
    this.velrange = new SlidablePropertyMetadata(64);
    this.release = new SlidablePropertyMetadata(64);
    this.probability = new SlidablePropertyMetadata(0.5);
  }
}

export default class SlideTransformer extends Transformer {
  constructor() {
    super();
    this.metadata = new SlidablePropertiesMetadata();
    this.edgeBehavior = "clamp";
    this.spreadAnchor = ANCHOR.MIDPOINT; // TODO: rename this to anchor
    this.tension = 1;
    this.strumUnlockEnd = false;
  }

  set notes(notes) {
    super.setNotes(notes);

    for (const property of ["start", "pitch", "velocity", "duration", "velrange", "release", "probability"]) {
      let values = notes.map((note) => note.get(property));

      let min = Math.min.apply(null, values);
      let max = Math.max.apply(null, values);
      let midpoint = (max + min) / 2;

      const propertyMetadata = this.metadata[property];
      propertyMetadata.min = min;
      propertyMetadata.midpoint = midpoint;
      propertyMetadata.max = max;
    }

    this._strumIndexForPitch = null;
  }

  get strumIndexForPitch() {
    if (!this._strumIndexForPitch) {
      // Future enhancement: This could group by notes playing at the same time (group by chords) and
      // index them separately, for consistent timing changes between each chord's top and bottom notes.
      const pitches = [];
      for (const note of this.oldNotes) {
        if (pitches.indexOf(note.pitch) < 0) {
          pitches.push(note.pitch);
        }
      }
      const sortedPitches = pitches.sort((a, b) => a - b);
      const indexForPitch = {};
      sortedPitches.forEach((pitch, index) => indexForPitch[pitch] = index);
      this._strumIndexForPitch = indexForPitch;
    }
    return this._strumIndexForPitch;
  }

  /**
    Set maximum change in value for the given property.
    The range value for each property applies to its average, spread, and random operations.
    - property is velocity, start, duration
    - amount is from 0 to 127 for pitch and velocity, or a positive number in beats for start/duration
  */
  setRange(property, amount) {
    this.metadata[property].range = amount;
  }

  transform(property, mapValue) {
    this.newNotes.forEach((newNote, index) => {
      const oldNote = this.oldNotes[index];
      newNote.set(property, mapValue(oldNote.get(property), index));
    });
    return applyEdgeBehavior(this.edgeBehavior, property, this.newNotes, this.clip);
  }
  /**
   Shift all notes' property values by the same amount.
   - property is velocity, start, duration
   - amount should be from -1.0 to 1.0
   */
  shift(property, amount) {
    amount *= this.metadata[property].range;
    return this.transform(property, (value) => value + amount);
  }

  /**
   Spread the notes' property values towards or away from the midpoint value.
   - property is velocity, start, duration
   - amount should be from -1.0 to 1.0
  */
  spread(property, amount) {
    const { max, min, midpoint, range } = this.metadata[property];
    let spreadPoint;
    let largestDelta = 0;

    switch (this.spreadAnchor) {
      case ANCHOR.MIN:
        spreadPoint = min;
        largestDelta = max - min;
        break;

      case ANCHOR.MIDPOINT:
        spreadPoint = midpoint;
        largestDelta = midpoint - min;
        break;

      case ANCHOR.MAX:
        spreadPoint = max;
        largestDelta = max - min;
        break;
    }

    if (largestDelta === 0) return this.newNotes;

    return this.transform(property, (value) => value + (amount * range * (value - spreadPoint)) / largestDelta);
  }

  strum(property, amount) {
    const { range } = this.metadata.strum;
    const indexForPitch = this.strumIndexForPitch;
    const total = Object.keys(indexForPitch).length - 1;
    const unlockEnd = this.strumUnlockEnd;

    this.newNotes.forEach((newNote, noteIndex) => {
      const oldNote = this.oldNotes[noteIndex];
      const index = indexForPitch[oldNote.pitch];
      let shift = 0;
      switch (this.spreadAnchor) {
        case ANCHOR.MIN:
          shift = Math.pow(index / total, this.tension) * range * amount;
          break;
        case ANCHOR.MIDPOINT:
          shift = (Math.pow(index / total, this.tension) - 1 / 2) * range * amount;
          break;
        case ANCHOR.MAX:
          shift = Math.pow((total - index) / total, this.tension) * range * amount;
          break;
      }
      newNote[property] = oldNote[property] + shift;
      if (property === "start" && !unlockEnd) {
        // the end is locked in place so we need to change the duration to compensate the start time shift
        newNote.duration = oldNote.duration - shift;
      }
    });

    if (property === "start") {
      if (unlockEnd) {
        // we're sliding the notes around without changing the duration and can apply standard edge behavior
        return applyEdgeBehavior(this.edgeBehavior, "start", this.newNotes, this.clip);
      } else {
        return applyEdgeBehavior(this.edgeBehavior, "strumStart", this.newNotes, this.clip);
      }
    } else {
      return applyEdgeBehavior(this.edgeBehavior, "strumEnd", this.newNotes, this.clip);
    }
  }

  /**
   2-D randomization for the notes' property value.
   - property is velocity, start, duration
   - amountX and amountY should be from -1.0 to 1.0
   The randomization behavior is consistent until the next bang/reset, in other words:
   random('velocity', 0.5, -0.25) will always have the same effect until the next reset (i.e. mouseup)
  */
  randomize2D(property, amountX, amountY) {
    const range = this.metadata[property].range;
    // We halve the range because two random values are added, which would have a max of range + range
    amountX *= range / 2;
    amountY *= range / 2;
    return this.transform(
      property,
      (value, index) => value + this.bipolarRandom1[index] * amountX + this.bipolarRandom2[index] * amountY
    );
  }
}
