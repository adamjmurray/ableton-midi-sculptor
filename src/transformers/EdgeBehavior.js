import Note from "../Note";
import { clamp, mod, reflectedMod } from "../utils";

// NOTE: Edge behaviors destructively modify the Notes for efficiency.
// The Transformers keep a separate copy of the original notes and regenerates modified notes
// on each transformation, so we can safely modify the given list of notes here.
// The return value needs to be used by the Transformer, because the note list could be filtered.

const behaviors = {
  clamp: {
    pitch: (notes) => {
      // Let Note.toLiveAPI() handle the clamping
      return notes;
    },
    velocity: (notes) => {
      // Let Note.toLiveAPI() handle the clamping
      return notes;
    },
    start: (notes, clip) => {
      if (clip) {
        // We use clip.end - Note.MIN_DURATION as the max start time so the note will be audible.
        // Otherwise if it starts exactly at the end of the clip, it will not play.
        const maxStart = clip.end - Note.MIN_DURATION;
        notes.forEach((note) => (note.start = clamp(note.start, clip.start, maxStart)));
      }
      return notes;
    },
    duration: (notes, clip) => {
      if (clip) {
        notes.forEach((note) => (note.duration = clamp(note.duration, Note.MIN_DURATION, clip.length - note.start)));
      }
      return notes;
    },
    velrange: (notes) => {
      // Let Note.toLiveAPI() handle the clamping
      return notes;
    },
    release: (notes) => {
      // Let Note.toLiveAPI() handle the clamping
      return notes;
    },
    probability: (notes) => {
      // Let Note.toLiveAPI() handle the clamping
      return notes;
    },
    strumStart: (notes, clip) => {
      notes.forEach((note) => {
        // stop moving the start once duration hits the beginning of the clip or the min duration
        const oldStart = note.start;
        note.start = clamp(note.start, clip.start, note.start + note.duration - Note.MIN_DURATION);
        // the duration was changing with the start time, so we have to compensate for any changes we make here:
        note.duration -= note.start - oldStart;
      });
      return notes;
    },
    strumEnd: (notes, clip) => {
      if (clip) {
        notes.forEach((note) => (note.duration = clamp(note.duration, Note.MIN_DURATION, clip.end - note.start)));
      }
      return notes;
    },
  },

  rotate: {
    pitch: (notes) => {
      notes.forEach((note) => (note.pitch = mod(note.pitch, 128)));
      return notes;
    },
    velocity: (notes) => {
      notes.forEach((note) => (note.velocity = mod(note.velocity, 128)));
      return notes;
    },
    start: (notes, clip) => {
      if (clip) {
        notes.forEach((note) => {
          const relativeStart = note.start - clip.start;
          note.start = mod(relativeStart, clip.length) + clip.start;
        });
      }
      return notes;
    },
    duration: (notes, clip) => {
      if (clip) {
        notes.forEach((note) => {
          note.duration = mod(note.duration, clip.length);
          note.duration = Math.max(note.duration, Note.MIN_DURATION);
        });
      }
      return notes;
    },
    velrange: (notes) => {
      notes.forEach((note) => (note.velrange = mod(note.velrange + 127, 255) - 127));
      return notes;
    },
    release: (notes) => {
      notes.forEach((note) => (note.release = mod(note.release, 128)));
      return notes;
    },
    probability: (notes) => {
      notes.forEach((note) => (note.probability = mod(note.probability, 1.0)));
      return notes;
    },
    strumStart: (notes, clip) => {
      // rotate to the start of the note when hitting the end of the note or the start of the clip
      notes.forEach((note) => {
        const oldStart = note.start;
        const relativeStart = note.start - clip.start;
        const noteEnd = note.start + note.duration;
        note.start = mod(relativeStart, noteEnd - clip.start) + clip.start;
        note.start = Math.min(note.start, noteEnd - Note.MIN_DURATION);
        // the duration was changing with the start time, so we have to compensate for any changes we make here:
        note.duration -= note.start - oldStart;
      });
      return notes;
    },
    strumEnd: (notes, clip) => {
      // rotate to the end of the note when hitting the beginning of the note or the end of the clip
      notes.forEach((note) => {
        note.duration = mod(note.duration, clip.end - note.start);
        note.duration = Math.max(note.duration, Note.MIN_DURATION);
      });
      return notes;
    },
  },

  reflect: {
    pitch: (notes) => {
      notes.forEach((note) => (note.pitch = reflectedMod(note.pitch, 127)));
      return notes;
    },
    velocity: (notes) => {
      notes.forEach((note) => (note.velocity = reflectedMod(note.velocity, 127)));
      return notes;
    },
    start: (notes, clip) => {
      if (clip) {
        notes.forEach((note) => {
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
        notes.forEach((note) => {
          note.duration = reflectedMod(note.duration, clip.length);
          note.duration = Math.max(note.duration, Note.MIN_DURATION);
        });
      }
      return notes;
    },
    velrange: (notes) => {
      notes.forEach((note) => (note.velrange = reflectedMod(note.velrange + 127, 254) - 127));
      return notes;
    },
    release: (notes) => {
      notes.forEach((note) => (note.release = reflectedMod(note.release, 127)));
      return notes;
    },
    probability: (notes) => {
      notes.forEach((note) => (note.probability = reflectedMod(note.probability, 1.0)));
      return notes;
    },
    strumStart: (notes, clip) => {
      // reflect between the note end time and start of the clip
      notes.forEach((note) => {
        const oldStart = note.start;
        const relativeStart = note.start - clip.start;
        const noteEnd = note.start + note.duration;
        note.start = reflectedMod(relativeStart, noteEnd - clip.start) + clip.start;
        note.start = Math.min(note.start, noteEnd - Note.MIN_DURATION);
        // the duration was changing with the start time, so we have to compensate for any changes we make here:
        note.duration -= note.start - oldStart;
      });
      return notes;
    },
    strumEnd: (notes, clip) => {
      // reflect between the note start time and the end of the clip
      notes.forEach((note) => {
        note.duration = reflectedMod(note.duration, clip.end - note.start);
        note.duration = Math.max(note.duration, Note.MIN_DURATION);
      });
      return notes;
    },
  },

  remove: {
    pitch: (notes) => {
      for (const note of notes) {
        note.deleted = note.pitch < 0 || note.pitch > 127;
      }
      return notes;
    },
    velocity: (notes) => {
      for (const note of notes) {
        note.deleted = note.velocity < 0;
      }
      return notes;
    },
    start: (notes) => {
      // Let the notes go past the clip boundaries so they don't play.
      // Don't actually remove them.
      return notes;
    },
    duration: (notes) => {
      for (const note of notes) {
        note.deleted = note.duration < Note.MIN_DURATION;
      }
      return notes;
    },
    velrange: (notes) => {
      // Never remove for any velrange value
      return notes;
    },
    release: (notes) => {
      // Never remove for any release value (does < 0 make sense? release is not really fundamental to the note)
      return notes;
    },
    probability: (notes) => {
      for (const note of notes) {
        note.deleted = note.probability < 0;
      }
      return notes;
    },
    strumStart: (notes) => {
      for (const note of notes) {
        note.deleted = note.duration < Note.MIN_DURATION;
      }
      return notes;
    },
    strumEnd: (notes) => {
      for (const note of notes) {
        note.deleted = note.duration < Note.MIN_DURATION;
      }
      return notes;
    },
  },
};

export function applyEdgeBehavior(behavior, property, notes, clip) {
  return behaviors[behavior]?.[property]?.(notes, clip);
}
