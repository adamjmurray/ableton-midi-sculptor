import assert from "assert";
import { Note } from "../src";

describe("Note", () => {
  describe("serialize", () => {

    it("returns [pitch, start, duration, velocity, muted] in the expected format", () => {
      assert.deepStrictEqual(
        new Note({ pitch: 60, velocity: 70, start: 0, duration: 1, muted: false }).serialize(),
        [60, '0.000000', '1.000000', 70, 0]
      );
      assert.deepStrictEqual(
        new Note({ pitch: 0, velocity: 0, start: -0.5, duration: 1.5, muted: true }).serialize(),
        [0, '-0.500000', '1.500000', 0, 1]
      );
    });

    it("ensures pitch is between 0 and 127", () => {
      assert.deepStrictEqual(
        new Note({ pitch: -1, velocity: 70, start: 0, duration: 1, muted: false }).serialize(),
        [0, '0.000000', '1.000000', 70, 0]
      );
      assert.deepStrictEqual(
        new Note({ pitch: 128, velocity: 70, start: 0, duration: 1, muted: false }).serialize(),
        [127, '0.000000', '1.000000', 70, 0]
      );
    });

    it("ensures duration is at least the Note.MIN_DURATION", () => {
      assert.deepStrictEqual(
        new Note({ pitch: 60, velocity: 70, start: 0, duration: -1, muted: false }).serialize(),
        [60, '0.000000', '0.003906', 70, 0]
      );
      assert.deepStrictEqual(
        new Note({ pitch: 60, velocity: 70, start: 0, duration: 0, muted: false }).serialize(),
        [60, '0.000000', '0.003906', 70, 0]
      );
    });

    it("ensures velocity is between 0 and 127", () => {
      assert.deepStrictEqual(
        new Note({ pitch: 60, velocity: -1, start: 0, duration: 1, muted: false }).serialize(),
        [60, '0.000000', '1.000000', 0, 0]
      );
      assert.deepStrictEqual(
        new Note({ pitch: 60, velocity: 128, start: 0, duration: 1, muted: false }).serialize(),
        [60, '0.000000', '1.000000', 127, 0]
      );
    });
  });
});
