import Transformer from './transformer'
import Clip from '../clip'
import Note from '../note'
// import { log } from '../logger'

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

type EdgeTransformation = (notes: Note[], clip: Clip) => Note[]

export type EdgeTransformationType = 'clip' | 'rotate' | 'reflect' | 'remove'

export enum SlidableProperty {
  START = 'start',
  PITCH = 'pitch',
  VELOCITY = 'velocity',
  DURATION = 'duration'
}
const SLIDABLE_PROPERTIES = Object.values(SlidableProperty)

class SlidablePropertyMetadata {
  range: number
  midpoint: number = 0
  maxMidpointDelta: number = 0
  random1: number[] = []
  random2: number[] = []
  constructor(defaultRange: number) {
    this.range = defaultRange
  }
}

class SlidablePropertiesMetadata {
  readonly [key: string]: SlidablePropertyMetadata
  readonly start = new SlidablePropertyMetadata(1)
  readonly pitch = new SlidablePropertyMetadata(12)
  readonly velocity = new SlidablePropertyMetadata(64)
  readonly duration = new SlidablePropertyMetadata(1)
}

// NOTE: All EdgeTransformers destructively modify the Notes for efficiency.
// The Slider transformer keeps a separate copy of the original notes and regenerates modified notes
// on each transformation, so we can safely modify here before serialization.
// The return value still needs to be used, because the note list could be filtered.
class EdgeTransformer { 
  readonly [key: string]: EdgeTransformation

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

const edgeTransformer = new EdgeTransformer

export default class SlideTransformer extends Transformer {

  private metadata = new SlidablePropertiesMetadata
  private oldNotes: Note[] = []
  private newNotes: Note[] = []
  private edgeTransformer: EdgeTransformation = edgeTransformer.clip

  set notes(notes: Note[]) {
    this.oldNotes = notes
    this.newNotes = notes.map(note => note.clone())
    for (const property of SLIDABLE_PROPERTIES) {
      let min = Infinity
      let max = -Infinity  
      let midpoint: number
      let maxMidpointDelta = 0
      const random1: number[] = []
      const random2: number[] = []

      notes.forEach((note, index) => {
        const value = note.get(property)
        min = Math.min(min, value)
        max = Math.max(max, value)
        // TODO: handle this in controller, or in a superclass, because every transformer will need it
        random1[index] = 2 * Math.random() - 1
        random2[index] = 2 * Math.random() - 1
      });
      midpoint = (max + min) / 2;
      maxMidpointDelta = 0
      for (const note of notes) {
        maxMidpointDelta = Math.max(maxMidpointDelta, Math.abs(midpoint - note.get(property)))
      }
      const propertyMetadata = this.metadata[property]
      propertyMetadata.midpoint = midpoint
      propertyMetadata.maxMidpointDelta = maxMidpointDelta
      propertyMetadata.random1 = random1
      propertyMetadata.random2 = random2
    }
  }

  set edgeBehavior(behavior: EdgeTransformationType) {
    this.edgeTransformer = edgeTransformer[behavior]
  }

  setRange(property: SlidableProperty, amount: number) {
    this.metadata[property].range = amount
  }

  private transform(clip: Clip, property: SlidableProperty, mapValue: (oldValue: number, index: number) => number) {
    this.newNotes.forEach((newNote, index) => {
      const oldNote = this.oldNotes[index]
      newNote.set(property, mapValue(oldNote.get(property), index))
    })
    return this.edgeTransformer(this.newNotes, clip)
  }

  /**
   Shift all notes' property values by the same amount.
   - property is velocity, start, duration
   - amount should be from -1.0 to 1.0
   */
  shift(clip: Clip, property: SlidableProperty, amount: number) {
    amount *= this.metadata[property].range
    return this.transform(clip, property, value => value + amount)
  }

  /**
   Spread the notes' property values towards or away from the midpoint value.
   - property is velocity, start, duration
   - amount should be from -1.0 to 1.0
  */
  spread(clip: Clip, property: SlidableProperty, amount: number) {
    const { range, midpoint, maxMidpointDelta } = this.metadata[property]
    amount = amount * range
    return this.transform(clip, property, value => value + (amount * (value - midpoint)/maxMidpointDelta))
  }

  /**
   2-D randomization for the notes' property value.
   - property is velocity, start, duration
   - amount1 and amount2 should be from -1.0 to 1.0

   The randomization behavior is consistent until the next bang/reset, in other words:
   random('velocity', 0.5, -0.25) will always have the same effect until the next reset (i.e. mouseup)
*/
  randomize2D(clip: Clip, property: SlidableProperty, amount1: number, amount2: number) {
    const { range, random1, random2 } = this.metadata[property]
    // We halve the range because two random values are added, which would have a max of range + range
    amount1 *= range/2
    amount2 *= range/2
    return this.transform(clip, property, (value, index) => value + (random1[index] * amount1) + (random2[index] * amount2))
  }
}
