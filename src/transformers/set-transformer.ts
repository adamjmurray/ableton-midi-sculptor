import Transformer from './transformer'
import Note, { NumericProperty } from '../note'
// import { log } from '../logger'

export type SettableProperty = 'note' | NumericProperty
export type SettableValue = 'deleted' | 'muted' | 'unmuted'

export default class SetTransformer extends Transformer {

  property: SettableProperty
  value: SettableValue

  set notes(notes: Note[]) {
    super.setNotes(notes)
  }

  private setValue(note: Note): Note | null {
    // Warning: This modifies the Note in place for efficiency
    const { property, value } = this;
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
      note.set(property, value)
    }
    return note
  }

  setAll(): Note[] {
    return this.newNotes
      .map(note => this.setValue(note))
      .filter(note => note) as Note[]
  }


  randomize2D(amountX: number, amountY: number): Note[] {
    return this.newNotes
      .map((note, index) => {
        if (this.isInRandomBounds(amountX, amountY, index)) {
          return this.setValue(note)
        } else {
          return this.oldNotes[index]
        }
      })
      .filter(note => note) as Note[]
  }
}
