const assert = require('assert')
import Clip from '../clip'
import Note from '../note'

function makeNotes(...values: number[]): Note[] {
  return values.map(val => new Note({ start: val, pitch: val, velocity: val, duration: val }))
}

function returnNotes(notes: Note[]): Array<number | string> {
  const apiNotes: Array<number | string> = ['notes', notes.length]
  for (const note of notes) {
    apiNotes.push('note', note.pitch, note.start, note.duration, note.velocity, note.muted ? 1 : 0)
  }
  apiNotes.push('done')
  return apiNotes
}

describe('Clip', () => {

  let clip: Clip
  beforeEach(() => clip = new Clip(Clip.SELECTED_CLIP_PATH))

  describe('selectedNotes', () => {
    it('returns the notes in the clip in sorted order (by time, pitch)', () => {
      LiveAPI.handleCall('get_selected_notes', () => returnNotes(makeNotes(3, 2, 1)))
      assert.deepEqual(makeNotes(1, 2, 3), clip.selectedNotes)
    })
  })
})
