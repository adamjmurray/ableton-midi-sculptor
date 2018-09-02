import assert from 'assert'
import { Note, SlideTransformer, SpreadAnchorType, SlidableProperty } from '../../src'

describe('SlideTransformer', () => {

  let slideTransformer: SlideTransformer
  let notes: Note[]
  beforeEach(() => {
    slideTransformer = new SlideTransformer()
  })

  function makeNotes(...values: number[]): Note[] {
    return values.map(val => new Note({ start: val, pitch: val, velocity: val, duration: val }))
  }

  function useNotes(...values: number[]) {
    notes = makeNotes(...values)
    slideTransformer.notes = notes
  }

  function clone(notes: Note[]): Note[] {
    return notes.map(n => n.clone())
  }

  describe('shift()', () => {

    beforeEach(() => {
      useNotes(1, 2, 3, 4)
      slideTransformer.edgeBehavior = 'clip'
      slideTransformer.spreadAnchor = SpreadAnchorType.MIDPOINT
    })

    it('shifts the note property values by the given range and amount ratio', () => {
      const expected = clone(notes)
      expected.forEach(note => note.pitch = note.pitch + 5)
      slideTransformer.setRange(SlidableProperty.PITCH, 5)
      assert.deepEqual(slideTransformer.shift(SlidableProperty.PITCH, 1.0), expected);
    })
  })
})
