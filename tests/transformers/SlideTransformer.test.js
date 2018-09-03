import assert from 'assert';
import { SlideTransformer, ANCHOR } from '../../src';
import { makeNotes, cloneAll } from '../helpers';

describe('SlideTransformer', () => {
  let slideTransformer;
  beforeEach(() => {
    slideTransformer = new SlideTransformer();
  });

  describe('shift()', () => {
    beforeEach(() => {
      slideTransformer.edgeBehavior = 'clip';
      slideTransformer.spreadAnchor = ANCHOR.MIDPOINT;
    });

    it('shifts the note property values by the given range and amount ratio', () => {
      const notes = makeNotes(1, 2, 3, 4);
      const expected = cloneAll(notes);
      expected.forEach(note => note.pitch += 5);

      slideTransformer.notes = notes;
      slideTransformer.setRange('pitch', 5);
      assert.deepEqual(slideTransformer.shift('pitch', 1.0), expected);
    });
  });
});
