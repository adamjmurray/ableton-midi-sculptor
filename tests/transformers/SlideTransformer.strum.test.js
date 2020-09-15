import assert from "assert";
import { cloneAll } from "../helpers";
import { Clip, Note, SlideTransformer } from "../../src";

function notesWithPitches(pitches) {
  return pitches.map((value) => new Note({ pitch: value }));
}

function makeNotes(noteData) {
  return noteData.map((data) => new Note(data));
}

describe("SlideTransformer", () => {
  let slideTransformer;
  beforeEach(() => {
    slideTransformer = new SlideTransformer();
  });

  describe("strum()", () => {
    it("strums the notes", () => {
      const notes = notesWithPitches([1, 2, 3, 4, 5]);
      const expectedStartTimes = [0, 0.25, 0.5, 0.75, 1];
      const expected = notes.map((note, idx) => new Note({ ...note.toJSON(), start: expectedStartTimes[idx] }));
      slideTransformer.notes = notes;
      slideTransformer.range = 1;
      assert.deepStrictEqual(slideTransformer.strum(1), expected);
    });

    it("can unstrum in the negative direction", () => {
      const notes = makeNotes([
        { start: 0, pitch: 1 },
        { start: 0.5, pitch: 2 },
        { start: 1, pitch: 3 },
      ]);
      const expected = notes.map((note) => new Note({ ...note.toJSON(), start: 0 }));
      slideTransformer.notes = notes;
      slideTransformer.range = 1;
      assert.deepStrictEqual(slideTransformer.strum(-1), expected);
    });
  });
});
