import assert from 'assert';
import { Clip, Note, SplitTransformer } from '../../src';

describe('SplitTransformer', () => {
  let splitTransformer;
  beforeEach(() => {
    splitTransformer = new SplitTransformer();
  });

  describe('split()', () => {
    context('"note" type', () => {
      it('splits the note into the given number of notes', () => {
        splitTransformer.gate = 1;
        splitTransformer.setSplitType('note', 2);
        splitTransformer.notes = [new Note({ start: 0, duration: 1 })];
        const expected = [
          new Note({ start: 0, duration: 0.5 }),
          new Note({ start: 0.5, duration: 0.5 })
        ];
        assert.deepEqual(splitTransformer.split(), expected);
      });

      it('splits the note into the given number of notes with minimal round-off error', () => {
        splitTransformer.gate = 1;
        splitTransformer.setSplitType('note', 11);
        splitTransformer.notes = [new Note({ start: 0, duration: 3 })];
        const expected = new Array(11).fill(0)
          .map((_, index) =>
            new Note({ start: 3 / 11 * index, duration: 3 / 11 })
          );
        assert.deepEqual(splitTransformer.split(), expected);
      });

      it("doesn't split into more than Clip.MAX_NOTES", () => {
        splitTransformer.gate = 1;
        splitTransformer.setSplitType('note', Clip.MAX_NOTES + 1);
        splitTransformer.notes = [new Note({ start: 0, duration: 1 })];
        assert.equal(splitTransformer.split().length, Clip.MAX_NOTES);
      });
    });
  });
});
