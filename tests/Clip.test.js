import assert from "assert";
import { Clip, Note } from "../src";

describe("Clip", () => {
  let clip;
  beforeEach(() => clip = Clip.selectedClip);

  describe("exists", () => {
    it('is false if the LiveAPI.id is "0"', () => {
      LiveAPI.id = "0";
      assert.strictEqual(clip.exists, false);
    });

    it('is true if the LiveAPI.id is not "0"', () => {
      LiveAPI.id = "1";
      assert.strictEqual(clip.exists, true);
    });
  });

  describe("isMidi", () => {
    it('is true if the Live API says this is a MIDI clip', () => {
      LiveAPI.mockProperty("is_midi_clip", true);
      assert.strictEqual(clip.isMidi, true);
      assert.deepStrictEqual(LiveAPI.gets, ["is_midi_clip"]);
    });

    it('is false if the Live API says this is not a MIDI clip', () => {
      LiveAPI.mockProperty("is_midi_clip", false);
      assert.strictEqual(clip.isMidi, false);
      assert.deepStrictEqual(LiveAPI.gets, ["is_midi_clip"]);
    });

    it('is false if clip.exists is false', () => {
      LiveAPI.mockProperty("is_midi_clip", true);
      LiveAPI.id = "0";
      assert.strictEqual(clip.isMidi, false);
    });

    it("caches the result until desync() is called", () => {
      LiveAPI.mockProperty("is_midi_clip", true);
      assert.strictEqual(clip.isMidi, true);
      assert.strictEqual(clip.isMidi, true);
      assert.deepStrictEqual(LiveAPI.gets, ["is_midi_clip"]);
      clip.desync();
      LiveAPI.mockProperty("is_midi_clip", false);
      assert.strictEqual(clip.isMidi, false);
      assert.strictEqual(clip.isMidi, false);
      assert.deepStrictEqual(LiveAPI.gets, ["is_midi_clip", "is_midi_clip"]);
    });
  });

  describe("length", () => {
    it("uses the Live API to get the clip length", () => {
      LiveAPI.mockProperty("length", 4);
      assert.strictEqual(clip.length, 4);
      assert.deepStrictEqual(LiveAPI.gets, ["length"]);
    });

    it("defaults to 0 for non-existent clips", () => {
      LiveAPI.mockProperty("length", null);
      assert.strictEqual(clip.length, 0);
      assert.deepStrictEqual(LiveAPI.gets, ["length"]);
    });

    it("caches the result until desync() is called", () => {
      LiveAPI.mockProperty("length", 4);
      assert.strictEqual(clip.length, 4);
      assert.strictEqual(clip.length, 4);
      assert.deepStrictEqual(LiveAPI.gets, ["length"]);
      clip.desync();
      LiveAPI.mockProperty("length", 1);
      assert.strictEqual(clip.length, 1);
      assert.strictEqual(clip.length, 1);
      assert.deepStrictEqual(LiveAPI.gets, ["length", "length"]);
    });
  });

  describe("start", () => {
    it("uses the Live API to get the clip start", () => {
      LiveAPI.mockProperty("loop_start", 4);
      assert.strictEqual(clip.start, 4);
      assert.deepStrictEqual(LiveAPI.gets, ["loop_start"]);
    });

    it("defaults to 0 for non-existent clips", () => {
      LiveAPI.mockProperty("loop_start", null);
      assert.strictEqual(clip.start, 0);
      assert.deepStrictEqual(LiveAPI.gets, ["loop_start"]);
    });

    it("caches the result until desync() is called", () => {
      LiveAPI.mockProperty("loop_start", 4);
      assert.strictEqual(clip.start, 4);
      assert.strictEqual(clip.start, 4);
      assert.deepStrictEqual(LiveAPI.gets, ["loop_start"]);
      clip.desync();
      LiveAPI.mockProperty("loop_start", 1);
      assert.strictEqual(clip.start, 1);
      assert.strictEqual(clip.start, 1);
      assert.deepStrictEqual(LiveAPI.gets, ["loop_start", "loop_start"]);
    });
  });

  describe("end", () => {
    it("uses the Live API to get the clip end", () => {
      LiveAPI.mockProperty("loop_end", 4);
      assert.strictEqual(clip.end, 4);
      assert.deepStrictEqual(LiveAPI.gets, ["loop_end"]);
    });

    it("defaults to 0 for non-existent clips", () => {
      LiveAPI.mockProperty("loop_end", null);
      assert.strictEqual(clip.end, 0);
      assert.deepStrictEqual(LiveAPI.gets, ["loop_end"]);
    });


    it("caches the result until desync() is called", () => {
      LiveAPI.mockProperty("loop_end", 4);
      assert.strictEqual(clip.end, 4);
      assert.strictEqual(clip.end, 4);
      assert.deepStrictEqual(LiveAPI.gets, ["loop_end"]);
      clip.desync();
      LiveAPI.mockProperty("loop_end", 1);
      assert.strictEqual(clip.end, 1);
      assert.strictEqual(clip.end, 1);
      assert.deepStrictEqual(LiveAPI.gets, ["loop_end", "loop_end"]);
    });
  });

  describe("selectedNotes", () => {
    it("returns the notes in the clip in sorted order by start time, with pitch as a tie-breaker", () => {
      LiveAPI.mockCall("get_selected_notes_extended", () => `
        {
          "notes": [
            { "note_id": 1, "pitch": 84, "start_time": 0.0, "duration": 1.5, "velocity": 78.08572387695312, "mute": 0,
              "probability": 0.5120000243186951, "velocity_deviation": -37.0, "release_velocity": 41.0 },
              { "note_id": 2, "pitch": 70, "start_time": 1.5, "duration": 1.5, "velocity": 67.08572387695312, "mute": 1,
              "probability": 1.0, "velocity_deviation": 0.0, "release_velocity": 64.0 },
            { "note_id": 3, "pitch": 81, "start_time": 0.0, "duration": 1.5, "velocity": 67.08572387695312, "mute": 0,
              "probability": 1.0, "velocity_deviation": 0.0, "release_velocity": 64.0 }
          ]
        }
      `);

      assert.deepStrictEqual(clip.selectedNotes,
        [
          new Note({
            duration: 1.5,
            id: 3,
            muted: false,
            pitch: 81,
            probability: 1,
            release: 64,
            start: 0,
            velocity: 67.08572387695312,
            velrange: 0,
          }),
          new Note({
            duration: 1.5,
            id: 1,
            muted: false,
            pitch: 84,
            probability: 0.5120000243186951,
            release: 41,
            start: 0,
            velocity: 78.08572387695312,
            velrange: -37,
          }),
          new Note({
            duration: 1.5,
            id: 2,
            muted: true,
            pitch: 70,
            probability: 1,
            release: 64,
            start: 1.5,
            velocity: 67.08572387695312,
            velrange: 0,
          }),
        ]
      );
    });
  });

  describe("selectAllNotes()", () => {
    it("calls the Live API `select_all_notes` function before returning the selectedNotes", () => {
      LiveAPI.mockCall("select_all_notes", () => { });
      LiveAPI.mockCall("get_selected_notes_extended", () => `
        {
          "notes": [
            { "note_id": 1, "pitch": 60, "start_time": 0.0, "duration": 1.0, "velocity": 100.0, "mute": 0,
              "probability": 1.0, "velocity_deviation": 0.0, "release_velocity": 0.0 }
          ]
        }
      `);
      assert.deepStrictEqual(
        clip.selectAllNotes(),
        [
          new Note({
            id: 1,
            pitch: 60,
            start: 0,
            duration: 1,
            velocity: 100,
            muted: false,
            probability: 1.0,
            velrange: 0,
            release: 0,
          }),
        ]
      );
      assert.deepStrictEqual(
        LiveAPI.calls,
        [
          ['select_all_notes'],
          ['get_selected_notes_extended'],
        ]
      )
    });
  });
});
