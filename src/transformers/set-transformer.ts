import Transformer from './transformer'
import Note, { NumericProperty } from '../note'
// import { log } from '../logger'

export type SettableProperty = 'note' | NumericProperty
export type SettableValue = 'deleted' | 'muted' | 'unmuted'
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

  setValues(property: SettableProperty, value: SettableValue): Note[] {
    const inPattern = this.isNoteInPattern
    if (property === 'note') {
      if (value === 'deleted') {
        return this.newNotes.filter((note, index) => !inPattern(note, index))
      }
      else if (value === 'muted' || value === 'unmuted') {
        const muted = (value === 'muted')
        this.newNotes.forEach((note, index) => {
          if (inPattern(note, index)) {
            note.muted = muted
          }
        })
      }
    } else if (typeof value === 'number') {
      this.newNotes.forEach((note, index) => {
        if (inPattern(note, index)) {
          note.set(property, value)
        }
      })
    }
    return this.newNotes
  }

  randomize2D(property: SettableProperty, value: SettableValue, amountX: number, amountY: number): Note[] {
    const notes: Note[] = []
    this.newNotes.forEach((note, index) => {
      if (this.isNoteInPattern(note, index)) {
        if (this.isInRandomBounds(amountX, amountY, index)) {
          if (property === 'note') {
            if (value === 'deleted') {
              return // delete the note
            } else if (value === 'muted') {
              note.muted = true
            } else if (value === 'unmuted') {
              note.muted = false
            }
          } else if (typeof value === 'number') {
            note.set(property, value)
          }
        } else { // reset back to oldNote value (since randomization occurs multiple times before a desync)
          if (property === 'note') {
            note.muted = this.oldNotes[index].muted
          } else {
            note.set(property, this.oldNotes[index].get(property))
          }
        }
      }
      notes.push(note)
    })
    return notes
  }
}
