import assert from 'assert';
import { SwapTransformer } from '../../src';
import { makeNotes, cloneAll } from '../helpers';

describe('SwapTransformer', () => {
  let swapTransformer;
  let notes;
  beforeEach(() => {
    swapTransformer = new SwapTransformer();
  });

  describe('rotate()', () => {
    beforeEach(() => {
      notes = makeNotes(1, 2, 3, 4);
      swapTransformer.notes = notes;
    });

    it('rotates forward through the note list when given a positive percentage value', () => {
      const expected = cloneAll(notes.slice(-1).concat(notes.slice(0, -1)));
      // rotating notes changes everything except the start time:
      expected.forEach((note, index) => note.start = notes[index].start);
      assert.deepStrictEqual(swapTransformer.rotate(1 / notes.length), expected);
    });

    it('rotate backwards through the note list when given a negative percentage value', () => {
      const expected = cloneAll(notes.slice(1).concat(notes.slice(0, 1)));
      // rotating notes changes everything except the start time:
      expected.forEach((note, index) => note.start = notes[index].start);
      assert.deepStrictEqual(swapTransformer.rotate(-1 / notes.length), expected);
    });

    it('is idempotent', () => {
      const expected = cloneAll(notes.slice(-1).concat(notes.slice(0, -1)));
      // rotating notes changes everything except the start time:
      expected.forEach((note, index) => note.start = notes[index].start);
      const actual1 = swapTransformer.rotate(1 / notes.length);
      assert.deepStrictEqual(actual1, expected);
      const actual2 = swapTransformer.rotate(1 / notes.length);
      assert.deepStrictEqual(actual2, expected);
    });

    it('can rotate more than one position', () => {
      const expected = cloneAll(notes.slice(-3).concat(notes.slice(0, -3)));
      // rotating notes changes everything except the start time:
      expected.forEach((note, index) => note.start = notes[index].start);
      const actual = swapTransformer.rotate(3 / notes.length);
      assert.deepStrictEqual(actual, expected);
    });

    it('can rotate with a value > notes.length and wraps around', () => {
      const expected = cloneAll(notes.slice(-3).concat(notes.slice(0, -3)));
      // rotating notes changes everything except the start time:
      expected.forEach((note, index) => note.start = notes[index].start);
      const actual = swapTransformer.rotate(1 + 3 / notes.length);
      assert.deepStrictEqual(actual, expected);
    });

    it('can rotate with a value < -notes.length and wraps around', () => {
      const expected = cloneAll(notes.slice(3).concat(notes.slice(0, 3)));
      // rotating notes changes everything except the start time:
      expected.forEach((note, index) => note.start = notes[index].start);
      const actual = swapTransformer.rotate(-1 - 3 / notes.length);
      assert.deepStrictEqual(actual, expected);
    });
  });
});
