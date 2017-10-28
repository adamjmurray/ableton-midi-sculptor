import Clip from '../clip'
import Note from '../note'
 
function mod(n: number, q: number): number {
  const value = n % q
  return value >= 0 ? value : value + q
}

function reflectedMod(n: number, q: number): number {
  n = Math.abs(n)
  const value = mod(n, q)
  const reversed = (Math.floor(n / q)) % 2 === 1
  return reversed ? q - value : value
}

function rotateOrReflect(notes: Note[], clip: Clip, operation: (n: number, q: number) => number): Note[] {
  for (const note of notes) {
    const relativeStart = note.start - clip.start
    note.start = operation(relativeStart, clip.length) + clip.start
    note.pitch = operation(note.pitch, 127) 
    note.velocity = operation(note.velocity, 127)
    const relativeDuration = note.duration - Note.MIN_DURATION
    note.duration = operation(relativeDuration, clip.length) + Note.MIN_DURATION
  }
  return notes
}

export type EdgeTransformer = (notes: Note[], clip: Clip) => Note[]
export type EdgeBehavior = 'clip' | 'rotate' | 'reflect' | 'remove'

// NOTE: All EdgeTransformers destructively modify the Notes for efficiency.
// The Slider transformer keeps a separate copy of the original notes and regenerates modified notes
// on each transformation, so we can safely modify here before serialization.
// The return value still needs to be used, because the note list could be filtered.
class EdgeTransformers { 
  readonly [key: string]: EdgeTransformer

  clip(notes: Note[], clip: Clip): Note[] {
    for (const note of notes) {
      note.start = Math.max(clip.start, Math.min(clip.end, note.start))
      note.pitch = Math.max(0, Math.min(127, note.pitch))
      note.velocity = Math.max(0, Math.min(127, note.velocity))
      note.duration = Math.max(Note.MIN_DURATION, Math.min(clip.length, note.duration))
    }
    return notes
  }

  rotate(notes: Note[], clip: Clip): Note[] {
    return rotateOrReflect(notes, clip, mod)
  }

  reflect(notes: Note[], clip: Clip): Note[] {
    return rotateOrReflect(notes, clip, reflectedMod)
  }

  remove(notes: Note[]): Note[] {
    // This serializers avoids clipping to min/max values.
    // When property values bcome invalid, the note is removed.
    // The one exception is when velocity exceeds 127, it is clipped to 127 (it's undesirable to remove a note that gets "too loud")   
    for (const note of notes) {
      note.velocity = Math.min(127, note.velocity)
    }
    return notes.filter(note => note.valid)
  }
}

export default new EdgeTransformers
