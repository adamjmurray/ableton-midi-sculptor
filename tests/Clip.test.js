import assert from 'assert';
import { Clip } from '../src';
import { makeNotes } from './helpers';

function returnNotes(notes) {
  const apiNotes = ['notes', notes.length];
  for (const note of notes) {
    apiNotes.push('note', note.pitch, note.start, note.duration, note.velocity, note.muted ? 1 : 0);
  }
  apiNotes.push('done');
  return apiNotes;
}

describe('Clip', () => {
  let clip;
  beforeEach(() => clip = Clip.getSelectedClip());

  describe('selectedNotes', () => {
    it('returns the notes in the clip in sorted order (by time, pitch)', () => {
      LiveAPI.mockCall('get_selected_notes', () => returnNotes(makeNotes(3, 2, 1)));
      assert.deepEqual(makeNotes(1, 2, 3), clip.selectedNotes);
    });
  });
});
