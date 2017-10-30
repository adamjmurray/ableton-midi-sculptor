import Transformer from './transformer'
import Note, { NumericProperty } from '../note'
import { mod } from '../utils'
// import { log } from '../logger'

export type SwappableProperty = NumericProperty

export default class SwapTransformer extends Transformer {

  private properties: SwappableProperty[] = []

  set notes(notes: Note[]) {
    super.setNotes(notes)
  }

  toggleProperty(property: SwappableProperty, enabled: boolean) {
    const existingPropertyIndex = this.properties.indexOf(property)
    const currentlyEnabled = existingPropertyIndex >= 0
    if (enabled) {
      if (!currentlyEnabled) {
        this.properties.push(property)
      }
    } else { // disable
      if (currentlyEnabled) {
        this.properties.splice(existingPropertyIndex, 1)
      }
    }
  }

  rotate(amount: number): Note[] {
    const oldNotes = this.oldNotes
    amount = Math.round(amount * oldNotes.length)    
    this.newNotes.forEach((note, index) => {
      const rotatedIndex = mod(index + amount, oldNotes.length)
      for (const property of this.properties) {        
        note.set(property, oldNotes[rotatedIndex].get(property))
      }
    })
    return this.newNotes
  }

  swapPairs(): Note[] {
    const oldNotes = this.oldNotes
    this.newNotes.forEach((note, index) => {
      const pairedNote = index % 2 === 0 ? oldNotes[index + 1] : oldNotes[index - 1]
      if (pairedNote) {
        for (const property of this.properties) {        
          note.set(property, pairedNote.get(property))
        }
      } 
    })
    return this.newNotes
  }

  reverse(): Note[] {
    const oldNotes = this.oldNotes
    this.newNotes.forEach((note, index) => {
      const pairedNote = oldNotes[oldNotes.length - 1 - index]
      for (const property of this.properties) {        
        note.set(property, pairedNote.get(property))
      } 
    })
    return this.newNotes
  }

  /**
   * Divide the note list into 2 halves and then interleave the halves together (like a zipper)
   * @param properties the properties that will be swapped
   */
  zip(): Note[] {
    const oldNotes = this.oldNotes
    const middleIndex = Math.floor(oldNotes.length / 2)
    this.newNotes.forEach((note, index) => {
      if (index / 2 >= middleIndex) return // last element in an odd-length array, leave it alone
      let pairedIndex
      if (index % 2 === 0) {
        pairedIndex = index / 2
      } else {
        pairedIndex = middleIndex + (index - 1) / 2
      }
      const pairedNote = oldNotes[pairedIndex]
      for (const property of this.properties) {        
        note.set(property, pairedNote.get(property))  
      } 
    })
    return this.newNotes
  }

  randomize2D(amountX: number, amountY: number): Note[] {
    const oldNotes = this.oldNotes
    this.newNotes.forEach((note, index) => {
      if (this.isInRandomBounds(amountX, amountY, index)) {
        const random = Math.abs(amountX > 0 ? this.bipolarRandom1[index] : this.bipolarRandom2[index])
        const targetIndex = Math.floor(random * oldNotes.length)
        if (targetIndex != index) {
          for (const property of this.properties) {
            note.set(property, oldNotes[targetIndex].get(property))
          }
          return
        }
      }
      // else revert to original value:
      for (const property of this.properties) {
        note.set(property, oldNotes[index].get(property))
      }
    })
    return this.newNotes
  }
}
