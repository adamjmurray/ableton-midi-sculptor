const assert = require('assert')
import Note from '../note'
import SwapTransformer from '../transformers/swap-transformer'

describe('SwapTransformer', () => {

  let swapTransformer: SwapTransformer
  let notes: Note[]
  beforeEach(() => {
    swapTransformer = new SwapTransformer()
  })

  function makeNotes(...values: number[]): Note[] {
    return values.map(val => new Note({ start: val, pitch: val, velocity: val, duration: val }))
  }

  function useNotes(...values: number[]) {
    notes = makeNotes(...values)
    swapTransformer.notes = notes
  }

  function clone(notes: Note[]): Note[] {
    return notes.map(n => n.clone())
  }

  describe('rotate()', () => {

    context('target: note, groupBy: all', () => {
      beforeEach(() => {
        useNotes(1, 2, 3, 4)
        // swapTransformer.target = 'note'
        // swapTransformer.groupBy('all')
      })

      it('rotates forward through the note list when given a positive percentage value', () => {
        const expected = clone(notes).slice(1).concat(notes.slice(0, 1))
        // rotating notes changes everything except the start time:
        expected.forEach((note, index) => note.start = notes[index].start)
        assert.deepEqual(swapTransformer.rotate(1 / notes.length), expected)
      })

      it('rotate backwards through the note list when given a negative percentage value', () => {
        const expected = clone(notes).slice(-1).concat(notes.slice(0, -1))
        // rotating notes changes everything except the start time:
        expected.forEach((note, index) => note.start = notes[index].start)
        assert.deepEqual(swapTransformer.rotate(-1 / notes.length), expected)
      })

      it('is idempotent', () => {
        const expected = clone(notes).slice(1).concat(notes.slice(0, 1))
        // rotating notes changes everything except the start time:
        expected.forEach((note, index) => note.start = notes[index].start)
        const actual1 = swapTransformer.rotate(1 / notes.length)
        assert.deepEqual(actual1, expected)
        const actual2 = swapTransformer.rotate(1 / notes.length)
        assert.deepEqual(actual2, expected)
      })

      it('can rotate more than one position', () => {
        const expected = clone(notes).slice(3).concat(notes.slice(0, 3))
        // rotating notes changes everything except the start time:
        expected.forEach((note, index) => note.start = notes[index].start)
        const actual = swapTransformer.rotate(3 / notes.length)
        assert.deepEqual(actual, expected)
      })

      it('can rotate with a value > notes.length and wraps around', () => {
        const expected = clone(notes).slice(3).concat(notes.slice(0, 3))
        // rotating notes changes everything except the start time:
        expected.forEach((note, index) => note.start = notes[index].start)
        const actual = swapTransformer.rotate(1 + 3 / notes.length)
        assert.deepEqual(actual, expected)
      })

      it('can rotate with a value < -notes.length and wraps around', () => {
        const expected = clone(notes).slice(-3).concat(notes.slice(0, -3))
        // rotating notes changes everything except the start time:
        expected.forEach((note, index) => note.start = notes[index].start)
        const actual = swapTransformer.rotate(-1 - 3 / notes.length)
        assert.deepEqual(actual, expected)
      })
    })

    //   context('target: note, groupBy: notes', () => {
    //     beforeEach(() => {
    //       useNotes(1,2,3,4,5,6)
    //       swapTransformer.target = 'note'
    //       swapTransformer.groupBy('notes', 3)
    //     })

    //     it('rotates within the group size', () => {
    //       const expected = makeNotes(2,3,1,5,6,4)
    //       expected.forEach((note, index) => note.start = notes[index].start)
    //       const actual = swapTransformer.rotate(1/notes.length)
    //       assert.deepEqual(actual, expected)
    //     })
    //   })

    //   context('target: group, groupBy: notes', () => {
    //     beforeEach(() => {
    //       useNotes(1,2,3,4,6,8,10,11,12)
    //       swapTransformer.target = 'group'
    //       swapTransformer.groupBy('notes', 3)
    //     })

    //     it('rotates within the group size', () => {
    //       const expected = makeNotes(10,11,12,1,2,3,4,6,8)
    //       const starts = [1,2,3,4,5,6,10,12,14]
    //       starts.forEach((start, index) => expected[index].start = start)
    //       const actual = swapTransformer.rotate(1/notes.length)
    //       actual.sort((n1,n2) => n1.start - n2.start)
    //       assert.deepEqual(actual, expected)
    //     })
    //   })

    //   context('target: group, groupBy: time', () => {
    //     beforeEach(() => {
    //       useNotes(0,1,2,4,5,7,12,13)
    //       swapTransformer.target = 'group'
    //       swapTransformer.groupBy('time', 4)
    //     })

    //     it('rotates within the group size', () => {
    //       const expected = makeNotes(12,13,0,1,2,4,5,7)
    //       const starts = [0,1,4,5,6,8,9,11]
    //       starts.forEach((start, index) => expected[index].start = start)
    //       const actual = swapTransformer.rotate(1/notes.length)
    //       actual.sort((n1,n2) => n1.start - n2.start)
    //       assert.deepEqual(actual, expected)
    //     })
    //   })
  })
})

