import assert from "assert";
import { Note } from "../src";

// TODO: Update for new Live API
describe("Note", () => {
  describe("fromLiveAPI()", () => {

    it('parses the Live API data into a Note object', () => {
      const apiData = {
        "note_id": 38,
        "pitch": 84,
        "start_time": 8,
        "duration": 1.5,
        "velocity": 78,
        "mute": 1,
        "probability": 0.5,
        "velocity_deviation": -37,
        "release_velocity": 41,
      };
      const note = Note.fromLiveAPI(apiData);

      assert.strictEqual(note.id, 38);
      assert.strictEqual(note.pitch, 84);
      assert.strictEqual(note.start, 8);
      assert.strictEqual(note.duration, 1.5);
      assert.strictEqual(note.velocity, 78);
      assert.strictEqual(note.muted, true);
      assert.strictEqual(note.probability, 0.5);
      assert.strictEqual(note.velrange, -37);
      assert.strictEqual(note.release, 41);

      assert.deepStrictEqual(note, new Note({
        id: 38,
        pitch: 84,
        start: 8,
        duration: 1.5,
        velocity: 78,
        muted: true,
        probability: 0.5,
        velrange: -37,
        release: 41,
      }))
    });
  });

  describe('toLiveAPI()', () => {
    it('serializes the Note into data for the Live API', () => {
      const note = new Note({
        id: 2,
        pitch: 65,
        start: 1.5,
        duration: 0.5,
        velocity: 99,
        muted: false,
        probability: 0.9,
        velrange: 10,
        release: 0,
      });
      assert.deepStrictEqual(note.toLiveAPI(), {
        "note_id": 2,
        "pitch": 65,
        "start_time": 1.5,
        "duration": 0.5,
        "velocity": 99,
        "mute": 0,
        "probability": 0.9,
        "velocity_deviation": 10,
        "release_velocity": 0,
      });
    });
  });
});
