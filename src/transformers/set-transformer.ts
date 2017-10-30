import Transformer from './transformer'
import Note, { NumericProperty } from '../note'
// import { log } from '../logger'

export type SettableProperty = NumericProperty | 'note'

export enum NotePropertyValue {
  MUTED,
  DELETED
}

export default class SetTransformer extends Transformer {

  set notes(notes: Note[]) {
    super.setNotes(notes)
  }

  setValues(property: SettableProperty, value: number): Note[] {
    if (property === 'note') {
      if (value === NotePropertyValue.MUTED) {
        this.newNotes.forEach(note => note.muted = true)
      } else {
        return [] // delete all the selected notes
      }
    } else {
      this.newNotes.forEach(note => note.set(property, value))
    }
    return this.newNotes
  }

  randomize2D(property: SettableProperty, value: number, amount1: number, amount2: number): Note[] {
    const notes: Note[] = []
    this.newNotes.forEach((note, index) => {
      if (this.isInRandomBounds(amount1, amount2, index)) {
        if (property === 'note') {
          if (value === NotePropertyValue.MUTED) {
            note.muted = true
          } else {
            return // delete the note
          }
        } else {
          note.set(property, value)
        }
      } else {
        if (property === 'note') {
          if (value === NotePropertyValue.MUTED) {
            note.muted = this.oldNotes[index].muted
          }
        } else {
          note.set(property, this.oldNotes[index].get(property))
        }
        
      }
      notes.push(note)      
    })
    return notes
  }
}
