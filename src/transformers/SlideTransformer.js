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
  }
}

export default class SlideTransformer extends Transformer {
  constructor() {
    super();
    this.metadata = new SlidablePropertiesMetadata();
    this.edgeBehavior = "clamp";
    this.spreadAnchor = ANCHOR.MIDPOINT;
  }

  set notes(notes) {
    super.setNotes(notes);

    for (const property of ["start", "pitch", "velocity", "duration"]) {
      let values = notes.map((note) => note.get(property));

      let min = Math.min.apply(null, values);
      let max = Math.max.apply(null, values);
      let midpoint = (max + min) / 2;

      const propertyMetadata = this.metadata[property];
      propertyMetadata.min = min;
      propertyMetadata.midpoint = midpoint;
      propertyMetadata.max = max;
    }

    this.sortedNotes = null;
    this.sortedNewNotes = null;
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

  strum(amount) {
    if (!this.sortedNotes) {
      // TODO: group all overlapping notes into chords
      this.sortedNotes = Object.freeze(
        this.oldNotes.map((note) => note.clone()).sort((a, b) => a.pitch - b.pitch || a.start - b.start)
      );
      this.sortedNewNotes = this.sortedNotes.map((note) => note.clone());
    }
    const { range } = this.metadata.strum;
    const total = this.oldNotes.length - 1;
    this.sortedNewNotes.forEach((newNote, index) => {
      const oldNote = this.sortedNotes[index];
      switch (this.spreadAnchor) {
        case ANCHOR.MIN:
          newNote.start = oldNote.start + (index / total) * range * amount;
          break;
        case ANCHOR.MIDPOINT:
          newNote.start = oldNote.start + ((index - total / 2) / total) * range * amount;
          break;
        case ANCHOR.MAX:
          newNote.start = oldNote.start + ((total - index) / total) * range * amount;
          break;
      }
    });

    // TODO:
    // - use this.tension (exponential) parameter
    // - add ability to lock end
    // - add ability to affect the end time (and optionally lock start)

    return applyEdgeBehavior(this.edgeBehavior, "start", this.sortedNewNotes, this.clip);
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
