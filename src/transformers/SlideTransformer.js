import Transformer from './Transformer';
import Note from '../Note';
import { mod, reflectedMod } from '../utils';

function rotateOrReflect(notes, operation, clip) {
  for (const note of notes) {
    note.pitch = operation(note.pitch, 127);
    note.velocity = operation(note.velocity, 127);

    if (clip) {
      const relativeStart = note.start - clip.start;
      const relativeDuration = note.duration - Note.MIN_DURATION;
      note.start = operation(relativeStart, clip.length) + clip.start;
      note.duration = operation(relativeDuration, clip.length) + Note.MIN_DURATION;
    }
  }

  return notes;
}

export let SpreadAnchorType;

(function(SpreadAnchorType) {
  SpreadAnchorType["MIN"] = "min";
  SpreadAnchorType["MIDPOINT"] = "mid";
  SpreadAnchorType["MAX"] = "max";
})(SpreadAnchorType || (SpreadAnchorType = {}));

export let SlidableProperty;

(function(SlidableProperty) {
  SlidableProperty["START"] = "start";
  SlidableProperty["PITCH"] = "pitch";
  SlidableProperty["VELOCITY"] = "velocity";
  SlidableProperty["DURATION"] = "duration";
})(SlidableProperty || (SlidableProperty = {}));

const SLIDABLE_PROPERTIES = Object.values(SlidableProperty);

class SlidablePropertyMetadata {
  constructor(defaultRange) {
    this.range = defaultRange;
    this.min = 0;
    this.midpoint = 0;
    this.max = 0;
    this.largestDeltaFromMin = 0;
    this.largestDeltaFromMidpoint = 0;
    this.largestDeltaFromMax = 0;
  }
}

class SlidablePropertiesMetadata {
  constructor() {
    this.start = new SlidablePropertyMetadata(1);
    this.pitch = new SlidablePropertyMetadata(12);
    this.velocity = new SlidablePropertyMetadata(64);
    this.duration = new SlidablePropertyMetadata(1);
  }
} // NOTE: All EdgeTransformers destructively modify the Notes for efficiency.
// The Slider transformer keeps a separate copy of the original notes and regenerates modified notes
// on each transformation, so we can safely modify here before serialization.
// The return value still needs to be used, because the note list could be filtered.


class EdgeTransformer {
  clip(notes, clip) {
    for (const note of notes) {
      note.pitch = Math.max(0, Math.min(127, note.pitch));
      note.velocity = Math.max(0, Math.min(127, note.velocity));

      if (clip) {
        note.start = Math.max(clip.start, Math.min(clip.end, note.start));
        note.duration = Math.max(Note.MIN_DURATION, Math.min(clip.length, note.duration));
      }
    }

    return notes;
  }

  rotate(notes, clip) {
    return rotateOrReflect(notes, mod, clip);
  }

  reflect(notes, clip) {
    return rotateOrReflect(notes, reflectedMod, clip);
  }

  remove(notes) {
    // This serializers avoids clipping to min/max values.
    // When property values bcome invalid, the note is removed.
    // The one exception is when velocity exceeds 127, it is clipped to 127
    // (because it's undesirable to remove a note that gets "too loud")
    for (const note of notes) {
      note.velocity = Math.min(127, note.velocity);
    }

    return notes.filter(note => note.valid);
  }

}

const edgeTransformer = new EdgeTransformer();
export default class SlideTransformer extends Transformer {
  constructor() {
    super();
    this.metadata = new SlidablePropertiesMetadata();
    this.edgeTransformation = edgeTransformer.clip;
    this.anchor = SpreadAnchorType.MIDPOINT;
  }

  set notes(notes) {
    super.setNotes(notes);

    for (const property of SLIDABLE_PROPERTIES) {
      let values = notes.map(note => note.get(property));
      let min = Math.min.apply(null, values);
      let max = Math.max.apply(null, values);
      let midpoint = (max + min) / 2;
      let largestDeltaFromMin = 0;
      let largestDeltaFromMidpoint = 0;
      let largestDeltaFromMax = 0;

      for (const note of notes) {
        largestDeltaFromMin = Math.max(largestDeltaFromMin, Math.abs(min - note.get(property)));
        largestDeltaFromMidpoint = Math.max(largestDeltaFromMidpoint, Math.abs(midpoint - note.get(property)));
        largestDeltaFromMax = Math.max(largestDeltaFromMax, Math.abs(max - note.get(property)));
      }

      const propertyMetadata = this.metadata[property];
      propertyMetadata.min = min;
      propertyMetadata.midpoint = midpoint;
      propertyMetadata.max = max;
      propertyMetadata.largestDeltaFromMin = largestDeltaFromMin;
      propertyMetadata.largestDeltaFromMidpoint = largestDeltaFromMidpoint;
      propertyMetadata.largestDeltaFromMax = largestDeltaFromMax;
    }
  }

  set edgeBehavior(transformationType) {
    this.edgeTransformation = edgeTransformer[transformationType];
  }

  set spreadAnchor(anchor) {
    this.anchor = anchor;
  }

  setRange(property, amount) {
    this.metadata[property].range = amount;
  }

  transform(property, mapValue) {
    this.newNotes.forEach((newNote, index) => {
      const oldNote = this.oldNotes[index];
      newNote.set(property, mapValue(oldNote.get(property), index));
    });
    return this.edgeTransformation(this.newNotes, this.clip);
  }
  /**
   Shift all notes' property values by the same amount.
   - property is velocity, start, duration
   - amount should be from -1.0 to 1.0
   */


  shift(property, amount) {
    amount *= this.metadata[property].range;
    return this.transform(property, value => value + amount);
  }
  /**
   Spread the notes' property values towards or away from the midpoint value.
   - property is velocity, start, duration
   - amount should be from -1.0 to 1.0
  */


  spread(property, amount) {
    const metadata = this.metadata[property];
    let spreadPoint;
    let largestDelta = 0;

    switch (this.anchor) {
      case SpreadAnchorType.MIN:
        spreadPoint = metadata.min;
        largestDelta = metadata.largestDeltaFromMin;
        break;

      case SpreadAnchorType.MIDPOINT:
        spreadPoint = metadata.midpoint;
        largestDelta = metadata.largestDeltaFromMidpoint;
        break;

      case SpreadAnchorType.MAX:
        spreadPoint = metadata.max;
        largestDelta = metadata.largestDeltaFromMax;
        break;
    }

    if (largestDelta === 0) return this.newNotes;
    amount = amount * metadata.range;
    return this.transform(property, value => value + amount * (value - spreadPoint) / largestDelta);
  }
  /**
   2-D randomization for the notes' property value.
   - property is velocity, start, duration
   - amountX and amountY should be from -1.0 to 1.0
   The randomization behavior is consistent until the next bang/reset, in other words:
   random('velocity', 0.5, -0.25) will always have the same effect until the next reset (i.e. mouseup)
  */


  randomize2D(property, amountX, amountY) {
    const range = this.metadata[property].range; // We halve the range because two random values are added, which would have a max of range + range

    amountX *= range / 2;
    amountY *= range / 2;
    return this.transform(property, (value, index) => value + this.bipolarRandom1[index] * amountX + this.bipolarRandom2[index] * amountY);
  }

}