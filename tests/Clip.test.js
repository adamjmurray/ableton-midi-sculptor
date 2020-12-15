import assert from "assert";
import { Clip, Note } from "../src";

describe("Clip", () => {
  let clip;
  beforeEach(() => (clip = Clip.getSelectedClip()));

  describe("selectedNotes", () => {
    it("returns the notes in the clip in sorted order by pitch", () => {
      LiveAPI.mockCall("get_selected_notes_extended", () => `
        {
          "notes": [
            { "note_id": 38, "pitch": 84, "start_time": 8.0, "duration": 1.5, "velocity": 78.08572387695312, "mute": 0,
              "probability": 0.5120000243186951, "velocity_deviation": -37.0, "release_velocity": 41.0 },
            { "note_id": 37, "pitch": 81, "start_time": 9.5, "duration": 1.5, "velocity": 67.08572387695312, "mute": 1,
              "probability": 1.0, "velocity_deviation": 0.0, "release_velocity": 64.0 }
          ]
        }
      `);

      assert.deepStrictEqual(clip.selectedNotes,
        [
          new Note({
            "duration": 1.5,
            "id": 38,
            "muted": false,
            "pitch": 84,
            "probability": 0.5120000243186951,
            "release": 41,
            "start": 8,
            "velocity": 78.08572387695312,
            "velrange": -37,
          }),
          new Note({
            "duration": 1.5,
            "id": 37,
            "muted": true,
            "pitch": 81,
            "probability": 1,
            "release": 64,
            "start": 9.5,
            "velocity": 67.08572387695312,
            "velrange": 0,
          }),
        ]
      );
    });
    // TODO: test sorting by time as the tie-breaker
  });
});
