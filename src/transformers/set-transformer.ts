import Transformer from './transformer'
import Note, { NumericProperty } from '../note'
// import { log } from '../logger'

export enum NotePropertyValue {
  DELETED,
  MUTED,
  UNMUTED
}
export type SettableProperty = NumericProperty | 'note'
export type SetPatternUnitType = 'note' | 'time'

export default class SetTransformer extends Transformer {

  private _pattern: boolean[] = [true]
  private patternUnitType: SetPatternUnitType = 'note'
  private patternUnitAmount: number = 1

  set notes(notes: Note[]) {
    super.setNotes(notes)
  }

  set pattern(pattern: boolean[]) {
    this._pattern = pattern
  }

  setPatternUnit(unitType: SetPatternUnitType, unitAmount: number) {
    this.patternUnitType = unitType
    this.patternUnitAmount = unitAmount
  }

  private isNoteInPattern(note: Note, noteIndex: number) {
    const pattern = this._pattern
    if (this.patternUnitType === 'note') {
      return pattern[Math.floor(noteIndex/this.patternUnitAmount) % pattern.length]
    } else { // time
      const offset = Math.floor(note.start / this.patternUnitAmount)
      return pattern[offset % pattern.length]
    }
  }

  setValues(property: SettableProperty, value: number): Note[] {
    if (property === 'note') {
      switch(value) {
        case NotePropertyValue.DELETED:
          return this.newNotes.filter(
            (note, index) => !this.isNoteInPattern(note, index))
        case NotePropertyValue.MUTED:
        case NotePropertyValue.UNMUTED:
          const muted = (value === NotePropertyValue.MUTED)
          this.newNotes.forEach((note, index) => {
            if (this.isNoteInPattern(note, index)) {
              note.muted = muted
            }
          })
      }
    } else {
      this.newNotes.forEach((note, index) => {
        if (this.isNoteInPattern(note, index)) {
          note.set(property, value)
        }
      })
    }
    return this.newNotes
  }

  randomize2D(property: SettableProperty, value: number, amountX: number, amountY: number): Note[] {
    const notes: Note[] = []
    this.newNotes.forEach((note, index) => {
      if (this.isInRandomBounds(amountX, amountY, index)) {
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
