import Transformer from './Transformer';
import Note from '../Note';
import { clamp, mod, reflectedMod } from '../utils';

export const ANCHOR = Object.freeze({
  MIN: 'min',
  MIDPOINT: 'mid',
  MAX: 'max',
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
  }
}
// NOTE: All EdgeTransformers destructively modify the Notes for efficiency.
// The Slider transformer keeps a separate copy of the original notes and regenerates modified notes
// on each transformation, so we can safely modify here before serialization.
// The return value still needs to be used, because the note list could be filtered.

const EdgeTransformer = {
  clip: { // TODO: rename to clamp
    pitch: notes => {
      notes.forEach(note => note.pitch = clamp(note.pitch, 0, 127));
      return notes;
    },
    velocity: notes => {
      notes.forEach(note => note.velocity = clamp(note.velocity, 0, 127));
      return notes;
    },
    start: (notes, clip) => {
      if (clip) {
        // We use clip.end - Note.MIN_DURATION as the max start time so the note will be audible.
        // Otherwise if it starts exactly at the end of the clip, it will not play.
        const maxStart = clip.end - Note.MIN_DURATION;
        notes.forEach(note => note.start = clamp(note.start, clip.start, maxStart));
      }
      return notes;
    },
    duration: (notes, clip) => {
      if (clip) {
        notes.forEach(note => note.duration = clamp(note.duration, Note.MIN_DURATION, clip.length));
      }
      return notes;
    },
  },

  rotate: {
    pitch: notes => {
      notes.forEach(note => note.pitch = mod(note.pitch, 128));
      return notes;
    },
    velocity: notes => {
      notes.forEach(note => note.velocity = mod(note.velocity, 128));
      return notes;
    },
    start: (notes, clip) => {
      if (clip) {
        notes.forEach(note => {
          const relativeStart = note.start - clip.start;
          note.start = mod(relativeStart, clip.length) + clip.start;
        });
      }
      return notes;
    },
    duration: (notes, clip) => {
      if (clip) {
        notes.forEach(note => {
          const relativeDuration = note.duration - Note.MIN_DURATION;
          note.duration = mod(relativeDuration, clip.length) + Note.MIN_DURATION;
        });
      }
      return notes;
    },
  },

  reflect: {
    pitch: notes => {
      notes.forEach(note => note.pitch = reflectedMod(note.pitch, 127));
      return notes;
    },
    velocity: notes => {
      notes.forEach(note => note.velocity = reflectedMod(note.velocity, 127));
      return notes;
    },
    start: (notes, clip) => {
      if (clip) {
        notes.forEach(note => {
          const relativeStart = note.start - clip.start;
          note.start = reflectedMod(relativeStart, clip.length) + clip.start;
          // We use clip.end - Note.MIN_DURATION as the max start time so the note will be audible
          // Otherwise if it starts exactly at the end of the clip, it will not play.
          note.start = Math.min(note.start, clip.end - Note.MIN_DURATION);
        });
      }
      return notes;
    },
    duration: (notes, clip) => {
      if (clip) {
        notes.forEach(note => {
          const relativeDuration = note.duration - Note.MIN_DURATION;
          note.duration = reflectedMod(relativeDuration, clip.length) + Note.MIN_DURATION;
        });
      }
      return notes;
    },
  },

  remove: {
    pitch: notes => {
      return notes.filter(note => note.pitch >= 0 && note.pitch <= 127);
    },
    velocity: notes => {
      // Special exception: When velocity exceeds 127, it is clamped to 127
      // because it's counterintuitive to remove a note that gets "too loud"
      notes.forEach(note => note.velocity = Math.min(note.velocity, 127));
      return notes.filter(note => note.velocity >= 0);
    },
    start: notes => {
      // Let the notes go past the clip boundaries so they don't play.
      // Don't actually remove them.
      return notes;
    },
    duration: notes => {
      return notes.filter(note => note.duration >= Note.MIN_DURATION);
    },
  },
}

export default class SlideTransformer extends Transformer {
  constructor() {
    super();
    this.metadata = new SlidablePropertiesMetadata();
    this.edgeTransformation = EdgeTransformer.clip;
    this.anchor = ANCHOR.MIDPOINT;
  }

  set notes(notes) {
    super.setNotes(notes);

    for (const property of ['start', 'pitch', 'velocity', 'duration']) {
      let values = notes.map(note => note.get(property));

      let min = Math.min.apply(null, values);
      let max = Math.max.apply(null, values);
      let midpoint = (max + min) / 2;

      const propertyMetadata = this.metadata[property];
      propertyMetadata.min = min;
      propertyMetadata.midpoint = midpoint;
      propertyMetadata.max = max;
    }
  }

  set edgeBehavior(transformationType) {
    this.edgeTransformation = EdgeTransformer[transformationType];
  }

  set spreadAnchor(anchor) {
    this.anchor = anchor;
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
    return this.edgeTransformation[property](this.newNotes, this.clip);
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
    const { max, min, midpoint, range } = this.metadata[property];
    let spreadPoint;
    let largestDelta = 0;

    switch (this.anchor) {
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

    return this.transform(property, value => value + amount * range * (value - spreadPoint) / largestDelta);
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
