import Note from '../Note';
import { clamp, mod, reflectedMod } from '../utils';

// NOTE: Edge behaviors destructively modify the Notes for efficiency.
// The Transformers keep a separate copy of the original notes and regenerates modified notes
// on each transformation, so we can safely modify the given list of notes here.
// The return value needs to be used by the Transformer, because the note list could be filtered.

const EdgeBehavior = {
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

export default EdgeBehavior;
