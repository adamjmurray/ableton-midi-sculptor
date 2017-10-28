import Transformer from './transformer'
import Clip from '../clip'
import Note from '../note'
import EdgeTransformers, { EdgeTransformer, EdgeBehavior } from './edge-transformers'
// import { log } from '../logger'

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

export default class Slider extends Transformer {

  private metadata = new SlidablePropertiesMetadata
  private oldNotes: Note[] = []
  private newNotes: Note[] = []
  private edgeTransformer: EdgeTransformer = EdgeTransformers.clip

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

  set edgeBehavior(behavior: EdgeBehavior) {
    this.edgeTransformer = EdgeTransformers[behavior]
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
