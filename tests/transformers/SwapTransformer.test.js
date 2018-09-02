import assert from 'assert';
import { Note, SwapTransformer } from '../../src';

describe('SwapTransformer', () => {
  var notes;
  var swapTransformer;
  beforeEach(() => {
    notes = null;
    swapTransformer = new SwapTransformer()
  });

  function makeNotes() {
    var values = [];
    for (var _i = 0; _i < arguments.length; _i++) {
      values[_i] = arguments[_i];
    }
    return values.map(function(val) { return new Note({ start: val, pitch: val, velocity: val, duration: val }); });
  }

  function useNotes() {
    var values = [];
    for (var _i = 0; _i < arguments.length; _i++) {
      values[_i] = arguments[_i];
    }
    notes = makeNotes.apply(void 0, values);
    swapTransformer.notes = notes;
  }

  function clone(notes) {
    return notes.map(function(n) { return n.clone(); });
  }

  describe('rotate()', () => {
    beforeEach(() => { return useNotes(1, 2, 3, 4); });
    it('rotates forward through the note list when given a positive percentage value', () => {
      var expected = clone(notes).slice(-1).concat(notes.slice(0, -1));
      // rotating notes changes everything except the start time:
      expected.forEach(function(note, index) { return note.start = notes[index].start; });
      assert.deepEqual(swapTransformer.rotate(1 / notes.length), expected);
    });

    it('rotate backwards through the note list when given a negative percentage value', () => {
      var expected = clone(notes).slice(1).concat(notes.slice(0, 1));
      // rotating notes changes everything except the start time:
      expected.forEach(function(note, index) { return note.start = notes[index].start; });
      assert.deepEqual(swapTransformer.rotate(-1 / notes.length), expected);
    });

    it('is idempotent', () => {
      var expected = clone(notes).slice(-1).concat(notes.slice(0, -1));
      // rotating notes changes everything except the start time:
      expected.forEach(function(note, index) { return note.start = notes[index].start; });
      var actual1 = swapTransformer.rotate(1 / notes.length);
      assert.deepEqual(actual1, expected);
      var actual2 = swapTransformer.rotate(1 / notes.length);
      assert.deepEqual(actual2, expected);
    });

    it('can rotate more than one position', () => {
      var expected = clone(notes).slice(-3).concat(notes.slice(0, -3));
      // rotating notes changes everything except the start time:
      expected.forEach(function(note, index) { return note.start = notes[index].start; });
      var actual = swapTransformer.rotate(3 / notes.length);
      assert.deepEqual(actual, expected);
    });

    it('can rotate with a value > notes.length and wraps around', () => {
      var expected = clone(notes).slice(-3).concat(notes.slice(0, -3));
      // rotating notes changes everything except the start time:
      expected.forEach(function(note, index) { return note.start = notes[index].start; });
      var actual = swapTransformer.rotate(1 + 3 / notes.length);
      assert.deepEqual(actual, expected);
    });

    it('can rotate with a value < -notes.length and wraps around', () => {
      var expected = clone(notes).slice(3).concat(notes.slice(0, 3));
      // rotating notes changes everything except the start time:
      expected.forEach(function(note, index) { return note.start = notes[index].start; });
      var actual = swapTransformer.rotate(-1 - 3 / notes.length);
      assert.deepEqual(actual, expected);
    });
  });
});
