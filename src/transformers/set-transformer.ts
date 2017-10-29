import Transformer from './transformer'
import Note, { NumericProperty } from '../note'
// import { log } from '../logger'

export type SettableProperty = NumericProperty | 'note'

export enum NotePropertyValue {
  MUTED,
  DELETED
}

function isInRandomizationBounds(amount1: number, amount2: number, random1: number, random2: number) {
  const inBounds1 = random1 >= 0 ? amount1 > random1 : amount1 < random1
  const inBounds2 = random2 >= 0 ? amount2 > random2 : amount2 < random2
  return inBounds1 && inBounds2
}

export default class SetTransformer extends Transformer {

  private oldNotes: Note[] = []
  private newNotes: Note[] = []
  private random1: number[] = []
  private random2: number[] = []

  set notes(notes: Note[]) {
    this.oldNotes = notes
    this.newNotes = notes.map(note => note.clone())
    notes.forEach((_, index) => {
      this.random1[index] = 2 * Math.random() - 1
      this.random2[index] = 2 * Math.random() - 1
    });
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
    // We halve the range because two random values are added, which would have a max of range + range
    const notes: Note[] = []
    this.newNotes.forEach((note, index) => {
      if (isInRandomizationBounds(amount1, amount2, this.random1[index], this.random2[index])) {
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
