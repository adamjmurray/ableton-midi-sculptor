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

export enum SpreadAnchorType {
  MIN = 'min',
  MIDPOINT = 'mid',
  MAX = 'max'
}

export enum SlidableProperty {
  START = 'start',
  PITCH = 'pitch',
  VELOCITY = 'velocity',
  DURATION = 'duration'
}
const SLIDABLE_PROPERTIES = Object.values(SlidableProperty)

class SlidablePropertyMetadata {
  range: number
  min: number
  midpoint: number
  max: number
  largestDeltaFromMin: number
  largestDeltaFromMidpoint: number
  largestDeltaFromMax: number
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
  private edgeTransformer: EdgeTransformation = edgeTransformer.clip
  private anchor = SpreadAnchorType.MIDPOINT

  set notes(notes: Note[]) {
    super.setNotes(notes)
    for (const property of SLIDABLE_PROPERTIES) {
      let values = notes.map(note => note.get(property))
      let min = Math.min.apply(null, values)
      let max = Math.max.apply(null, values)
      let midpoint = (max + min) / 2;
      let largestDeltaFromMin = 0
      let largestDeltaFromMidpoint = 0
      let largestDeltaFromMax = 0
      for (const note of notes) {
        largestDeltaFromMin = Math.max(largestDeltaFromMin, Math.abs(min - note.get(property)))
        largestDeltaFromMidpoint = Math.max(largestDeltaFromMidpoint, Math.abs(midpoint - note.get(property)))
        largestDeltaFromMax = Math.max(largestDeltaFromMax, Math.abs(max - note.get(property)))        
      }
      const propertyMetadata = this.metadata[property]
      propertyMetadata.min = min
      propertyMetadata.midpoint = midpoint
      propertyMetadata.max = max
      propertyMetadata.largestDeltaFromMin = largestDeltaFromMin
      propertyMetadata.largestDeltaFromMidpoint = largestDeltaFromMidpoint
      propertyMetadata.largestDeltaFromMax = largestDeltaFromMax
    }
  }

  set edgeBehavior(behavior: EdgeTransformationType) {
    this.edgeTransformer = edgeTransformer[behavior]
  }

  set spreadAnchor(anchor: SpreadAnchorType) {
    this.anchor = anchor
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
    const metadata = this.metadata[property]
    let spreadPoint: number
    let largestDelta = 0
    switch (this.anchor) {
      case SpreadAnchorType.MIN:
        spreadPoint = metadata.min
        largestDelta = metadata.largestDeltaFromMin
        break
      case SpreadAnchorType.MIDPOINT:
        spreadPoint = metadata.midpoint
        largestDelta =  metadata.largestDeltaFromMidpoint
        break
      case SpreadAnchorType.MAX:
        spreadPoint = metadata.max
        largestDelta =  metadata.largestDeltaFromMax
        break
    }
    if (largestDelta === 0) return this.newNotes
    amount = amount * metadata.range
    return this.transform(clip, property, value => value + (amount * (value - spreadPoint)/largestDelta))
  }

  /**
   2-D randomization for the notes' property value.
   - property is velocity, start, duration
   - amount1 and amount2 should be from -1.0 to 1.0

   The randomization behavior is consistent until the next bang/reset, in other words:
   random('velocity', 0.5, -0.25) will always have the same effect until the next reset (i.e. mouseup)
*/
  randomize2D(clip: Clip, property: SlidableProperty, amount1: number, amount2: number) {
    const range = this.metadata[property].range
    // We halve the range because two random values are added, which would have a max of range + range
    amount1 *= range/2
    amount2 *= range/2
    return this.transform(clip, property, (value, index) => value + (this.bipolarRandom1[index] * amount1) + (this.bipolarRandom2[index] * amount2))
  }
}
