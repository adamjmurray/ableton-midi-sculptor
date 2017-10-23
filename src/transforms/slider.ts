import Transformer from './transformer'
import Note from '../note'

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
  start = new SlidablePropertyMetadata(1)
  pitch = new SlidablePropertyMetadata(12)
  velocity = new SlidablePropertyMetadata(64)
  duration = new SlidablePropertyMetadata(1)
}

// interface SlideArguments {
//   notes: Note[]
//   property: SlidableProperty
//   amount: number
// }

export default class Slider extends Transformer {

  private metadata = new SlidablePropertiesMetadata 

  get notes(): Note[] {
    return this._notes
  }

  set notes(notes: Note[]) {
    this._notes = notes
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

  setRange(property: SlidableProperty, amount: number) {
    this.metadata[property].range = amount
  }

  /**
   Shift all notes' property values by the same amount.
   - property is velocity, start, duration
   - amount should be from -1.0 to 1.0
   */
  shift(property: SlidableProperty, amount: number) {
    const shiftedNotes: Note[] = []
    const { range } = this.metadata[property]
    amount *= range
    for (const note of this.notes) {
      const shiftedNote = note.clone()
      shiftedNote.set(property, amount + note.get(property))
      shiftedNotes.push(shiftedNote)
    }
    return shiftedNotes
  }

  /**
   Spread the notes' property values towards or away from the midpoint value.
   - property is velocity, start, duration
   - amount should be from -1.0 to 1.0
  */
  spread(property: SlidableProperty, amount: number) {
    const spreadNotes: Note[] = []
    const { range, midpoint, maxMidpointDelta } = this.metadata[property]
    amount = amount * range
    for (const note of this.notes) {
      const spreadNote = note.clone()
      const value = note.get(property)
      const newValue = value + amount * (value - midpoint)/maxMidpointDelta
      spreadNote.set(property, newValue)
      spreadNotes.push(spreadNote)
    }
    return spreadNotes
  }

  /**
   2-D randomization for the notes' property value.
   - property is velocity, start, duration
   - amount1 and amount2 should be from -1.0 to 1.0

   The randomization behavior is consistent until the next bang/reset, in other words:
   random('velocity', 0.5, -0.25) will always have the same effect until the next reset (i.e. mouseup)
*/
  randomize2D(property: SlidableProperty, amount1: number, amount2: number) {
    const randomizedNotes: Note[] = []
    const { range, random1, random2 } = this.metadata[property]
    // We halve the range because two random values are added, which would have a max of range + range
    amount1 *= range/2
    amount2 *= range/2
    this.notes.forEach((note, index) => {
      const randomizedNote = note.clone()
      const newValue = note.get(property) + (random1[index] * amount1) + (random2[index] * amount2)
      randomizedNote.set(property, newValue)
      randomizedNotes.push(randomizedNote)
    })
    return randomizedNotes
  }
}