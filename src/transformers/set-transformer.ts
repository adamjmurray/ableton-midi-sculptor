import Transformer from './transformer'
import Note, { NumericProperty } from '../note'
// import { log } from '../logger'

export type SettableProperty = 'note' | NumericProperty
export type SettableValue = 'deleted' | 'muted' | 'unmuted'
export type ValueOperation = 'to' | 'or'

export default class SetTransformer extends Transformer {

  property: SettableProperty
  value: SettableValue
  operation?: ValueOperation
  value2?: SettableValue

  set notes(notes: Note[]) {
    super.setNotes(notes)
  }

  private setValue(note: Note, noteIndex: number): Note | null {
    // Warning: This modifies the Note in place for efficiency
    const { property, value, operation, value2 } = this;
    if (property === 'note') {
      if (value === 'deleted') {
        return null
      }
      else if (value === 'muted') {
        note.muted = true
      }
      else if (value === 'unmuted') {
        note.muted = false
      }
    } else if (typeof value === 'number') {
      let val: number = value
      if (typeof value2 === 'number') {
        const val2: number = value2
        if (operation === 'or') {
          val = this.unipolarRandom[noteIndex] < 0.5 ? val : val2
        } else if (operation === 'to') {
          val += (val2 - val) * this.unipolarRandom[noteIndex]
        }
      }
      note.set(property, val)
    }
    return note
  }

  setAll(): Note[] {
    return this.newNotes
      .map((note, index) => this.setValue(note, index))
      .filter(note => note) as Note[]
  }

  randomize2D(amountX: number, amountY: number): Note[] {
    return this.newNotes
      .map((note, index) => {
        if (this.isInRandomBounds(amountX, amountY, index)) {
          return this.setValue(note, index)
        } else {
          return this.oldNotes[index]
        }
      })
      .filter(note => note) as Note[]
  }
}
