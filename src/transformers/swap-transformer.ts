import Transformer from './transformer'
import Note, { NumericProperty } from '../note'
import { mod } from '../utils'
// import { log } from '../logger'

export type SwappableProperty = 'note' | 'group' | 'pitch' | 'velocity' | 'duration' | 'pitch + velocity' | 'pitch + duration' | 'velocity + duration'
export type GroupType = 'all' | 'notes' | 'time'
export type ExtraGroupType = 'first' | 'last' | 'any' | 'new'

export default class SwapTransformer extends Transformer {

  private _target: SwappableProperty = 'note'
  private groupType: GroupType = 'all'
  private groupSize?= 2
  private extraGroupType: ExtraGroupType = 'new' // for note groupings
  private groupOffsetPercent: number = 0 // for time groupings, 100% is 1.0, negative values allowed

  set notes(notes: Note[]) {
    super.setNotes(notes)
  }

  set target(target: SwappableProperty) {
    this._target = target
  }

  private get targetProperties(): NumericProperty[] {
    switch (this._target) {
      case 'note': return ['pitch', 'velocity', 'duration']
      case 'pitch': return ['pitch']
      case 'velocity': return ['velocity']
      case 'duration': return ['duration']
      case 'pitch + velocity': return ['pitch', 'velocity']
      case 'pitch + duration': return ['pitch', 'duration']
      case 'velocity + duration': return ['velocity', 'duration']
      default: return []
    }
  }

  private swap(mapIndex: (noteIndex: number, size: number) => number): Note[] {
    const { newNotes, oldNotes, targetProperties } = this
    return newNotes.map((note, index) => {
      const mappedIndex = mapIndex(index, newNotes.length)
      const mappedNote = oldNotes[mappedIndex] || oldNotes[index]
      targetProperties.forEach(prop => note.set(prop, mappedNote.get(prop)))
      return note
    })
  }

  // TODO: now I need to adjust each algorithm below to respect groupings. I feel like it can be done generically...
  // We need to subdivide the notes up and run the algorithm on each group separately
  // So each of these functions needs to be refactored into a function (callback?) that takes a list of notes
  // and modifies them in place. We'll split newNotes and oldNotes based on the group settings

  rotate(amount: number): Note[] {
    amount = Math.round(amount * this.oldNotes.length)
    return this.swap((index, size) => mod(index + amount, size))
  }

  swapPairs(): Note[] {
    return this.swap(index => (index % 2 == 0) ? (index + 1) : (index - 1))
  }

  reverse(): Note[] {
    return this.swap((index, size) => size - index - 1)
  }

  /**
   * Divide the note list into 2 halves and then interleave the halves together (like a zipper)
   */
  zip(): Note[] {
    return this.swap((index, size) => {
      const middle = Math.floor(size / 2)
      // if (size % 2 === 1 && index === size - 1) return index // last element in an odd-length array, leave it alone
      return (index < middle) ? (2 * index + 1) : (index - middle) * 2
    })
  }

  // TODO?
  unzip(): Note[] {
    return this.swap((index, size) => {
      const middle = Math.floor(size / 2)
      // if (size % 2 === 1 && index === size - 1) return index // last element in an odd-length array, leave it alone
      return (index % 2 === 0) ? (middle + index / 2) : (index - 1) / 2
    })
  }

  randomize2D(amountX: number, amountY: number): Note[] {
    return this.swap((index, size) => {
      if (this.isInRandomBounds(amountX, amountY, index)) {
        // it might be better if there were a different random for each quadrant
        // and we want a random shuffling of the order that
        const random = Math.abs(amountX > 0 ? this.bipolarRandom1[index] : this.bipolarRandom2[index])
        return Math.floor(random * size)
      } else {
        return index
      }
    })
  }
}
