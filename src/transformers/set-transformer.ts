import Transformer from './transformer'
import Note, { NumericProperty } from '../note'
// import { log } from '../logger'

export type SettableProperty = NumericProperty | 'note'

export enum NotePropertyValue {
  MUTED,
  DELETED
}

function scaleAmount(amount: number): number {
  // use exponential curves for better usability, so you can see an effect with less mouse movement
  return Math.pow(Math.abs(amount), 0.67) * (amount < 0 ? -1 : 1) 
}

export default class SetTransformer extends Transformer {

  private oldNotes: Note[] = []
  private newNotes: Note[] = []
  private randoms: number[][] = [[1], [2], [3], [4], [5], [6], [7], [8]] // x and y random values for each quadrant

  set notes(notes: Note[]) {
    this.oldNotes = notes
    this.newNotes = notes.map(note => note.clone())
    notes.forEach((_, index) => {
      this.randoms.forEach(random => random[index] = Math.random())
    });
  }

  private isInRandomBounds(amount1: number, amount2: number, index: number) {
    if (amount1 > 0) {
      if (amount2 > 0) {
        return amount1 > this.randoms[0][index] && amount2 > this.randoms[1][index]
      } else {
        return amount1 > this.randoms[2][index] && -amount2 > this.randoms[3][index]
      }
    } else {
      if (amount2 > 0) {
        return -amount1 > this.randoms[4][index] && amount2 > this.randoms[5][index]
      } else {
        return -amount1 > this.randoms[6][index] && -amount2 > this.randoms[7][index]
      }
    }
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
    amount1 = scaleAmount(amount1)
    amount2 = scaleAmount(amount2)
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
