import { Note } from "../../src";
import { runSlideTransformerTests } from "../helpers";

describe("SlideTransformer", () => {
  runSlideTransformerTests("shift", {
    pitch: [
      {
        input: [10, 11, 12, 13],
        range: 20,
        amount: 0.5,
        expected: [20, 21, 22, 23],
      },
      {
        input: [10, 11, 12, 13],
        range: 20,
        amount: -0.25,
        expected: [5, 6, 7, 8],
      },
      {
        input: [10, 11, 12, 13],
        edgeBehavior: "clamp",
        range: 116,
        amount: 1,
        expected: [126, 127, 128, 129],
        description: "does not clamp to a max pitch (in the transformer)", // it used to clamp but now we let Node.toLiveAPI() handle it to avoid unnecessary work
      },
      {
        input: [10, 11, 12, 13],
        edgeBehavior: "clamp",
        range: 12,
        amount: -1,
        expected: [-2, -1, 0, 1],
        description: "does not clamp to a min pitch (in the transformer)", // it used to clamp but now we let Node.toLiveAPI() handle it to avoid unnecessary work
      },
      {
        input: [10, 11, 12, 13],
        edgeBehavior: "reflect",
        range: 116,
        amount: 1,
        expected: [126, 127, 126, 125],
        description: "reflects pitches above 127 to the negative direction",
      },
      {
        input: [10, 11, 12, 13],
        edgeBehavior: "reflect",
        range: 12,
        amount: -1,
        expected: [2, 1, 0, 1],
        description: "reflects pitches below 0 to the positive direction",
      },
      {
        input: [10, 11, 12, 13],
        edgeBehavior: "remove",
        range: 116,
        amount: 1,
        expected: [126, 127, { pitch: 128, deleted: true }, { pitch: 129, deleted: true }],
        description: "soft-deletes notes with pitches above 127",
      },
      {
        input: [10, 11, 12, 13],
        edgeBehavior: "remove",
        range: 12,
        amount: -1,
        expected: [{ pitch: -2, deleted: true }, { pitch: -1, deleted: true }, 0, 1],
        description: "soft-deletes  notes with pitches below 0",
      },
      {
        input: [10, 11, 12, 13],
        edgeBehavior: "rotate",
        range: 116,
        amount: 1,
        expected: [126, 127, 0, 1],
        description: "wraps pitches around from 127 to 0 in the positive direction",
      },
      {
        input: [10, 11, 12, 13],
        edgeBehavior: "rotate",
        range: 12,
        amount: -1,
        expected: [126, 127, 0, 1],
        description: "wraps pitches around from 0 to 127 in the negative direction",
      },
    ],
    //==================================================================================================================
    velocity: [
      {
        input: [10, 11, 12, 13],
        range: 20,
        amount: 0.5,
        expected: [20, 21, 22, 23],
      },
      {
        input: [10, 11, 12, 13],
        range: 20,
        amount: -0.25,
        expected: [5, 6, 7, 8],
      },
      {
        input: [10, 11, 12, 13],
        edgeBehavior: "clamp",
        range: 116,
        amount: 1,
        expected: [126, 127, 128, 129],
        description: "does not clamp to a max velocity (in the transformer)", // it used to clamp but now we let Node.toLiveAPI() handle it to avoid unnecessary work
      },
      {
        input: [10, 11, 12, 13],
        edgeBehavior: "clamp",
        range: 12,
        amount: -1,
        expected: [-2, -1, 0, 1],
        description: "does not clamp to a min velocity (in the transformer)", // it used to clamp but now we let Node.toLiveAPI() handle it to avoid unnecessary work
      },
      {
        input: [10, 11, 12, 13],
        edgeBehavior: "reflect",
        range: 116,
        amount: 1,
        expected: [126, 127, 126, 125],
        description: "reflects velocities above 127 to the negative direction",
      },
      {
        input: [10, 11, 12, 13],
        edgeBehavior: "reflect",
        range: 12,
        amount: -1,
        expected: [2, 1, 0, 1],
        description: "reflects velocities below 0 to the positive direction",
      },
      {
        // This is a special case to not remove notes that get "too loud", which felt very non-intuitive
        input: [10, 11, 12, 13],
        edgeBehavior: "remove",
        range: 116,
        amount: 1,
        expected: [126, 127, 128, 129],
        description: "does not soft-dlete notes with velocities above 127", // clamping is handled in Note.toLiveAPI()
      },
      {
        input: [10, 11, 12, 13],
        edgeBehavior: "remove",
        range: 12,
        amount: -1,
        expected: [{ velocity: -2, deleted: true }, { velocity: -1, deleted: true }, 0, 1],
        description: "soft-deletes notes with velocities below 0",
      },
      {
        input: [10, 11, 12, 13],
        edgeBehavior: "rotate",
        range: 116,
        amount: 1,
        expected: [126, 127, 0, 1],
        description: "wraps velocities around from 127 to 0 in the positive direction",
      },
      {
        input: [10, 11, 12, 13],
        edgeBehavior: "rotate",
        range: 12,
        amount: -1,
        expected: [126, 127, 0, 1],
        description: "wraps velocities around from 0 to 127 in the negative direction",
      },
    ],
    //==================================================================================================================
    start: [
      {
        input: [5, 6, 7, 8],
        range: 10,
        amount: 0.5,
        expected: [10, 11, 12, 13],
      },
      {
        input: [5, 6, 7, 8],
        range: 20,
        amount: -0.25,
        expected: [0, 1, 2, 3],
      },
      {
        input: [0, 1, 2, 3],
        clip: { start: 0, end: 8 },
        edgeBehavior: "clamp",
        range: 6,
        amount: 1,
        expected: [6, 7, 8 - Note.MIN_DURATION, 8 - Note.MIN_DURATION],
        description: "clamps start time to the clip end minus a small amount (so the note can play)",
      },
      {
        input: [4, 5, 6, 7],
        clip: { start: 4, end: 12 },
        edgeBehavior: "clamp",
        range: 6,
        amount: 1,
        expected: [10, 11, 12 - Note.MIN_DURATION, 12 - Note.MIN_DURATION],
        description: "clamps start time to the clip end minus a small amount (so the note can play)",
      },
      {
        input: [1, 2, 3, 4],
        clip: { start: 0, end: 8 },
        edgeBehavior: "clamp",
        range: 3,
        amount: -1,
        expected: [0, 0, 0, 1],
        description: "clamps start time to the clip start",
      },
      {
        input: [5, 6, 7, 8],
        clip: { start: 4, end: 12 },
        edgeBehavior: "clamp",
        range: 3,
        amount: -1,
        expected: [4, 4, 4, 5],
        description: "clamps start time to the clip start",
      },
      {
        input: [0, 1, 2, 3],
        clip: { start: 0, end: 8 },
        edgeBehavior: "rotate",
        range: 6,
        amount: 1,
        expected: [6, 7, 0, 1],
        description: "wraps start times around from clip end to clip start",
      },
      {
        input: [4, 5, 6, 7],
        clip: { start: 4, end: 12 },
        edgeBehavior: "rotate",
        range: 6,
        amount: 1,
        expected: [10, 11, 4, 5],
        description: "wraps start times around from clip end to clip start",
      },
      {
        input: [0, 1, 2, 3],
        clip: { start: 0, end: 8 },
        edgeBehavior: "rotate",
        range: 2,
        amount: -1,
        expected: [6, 7, 0, 1],
        description: "wraps start times around from clip start to clip end",
      },
      {
        input: [4, 5, 6, 7],
        clip: { start: 4, end: 12 },
        edgeBehavior: "rotate",
        range: 2,
        amount: -1,
        expected: [10, 11, 4, 5],
        description: "wraps start times around from clip end to clip start",
      },
      {
        input: [0, 1, 2, 3],
        clip: { start: 0, end: 8 },
        edgeBehavior: "reflect",
        range: 7,
        amount: 1,
        expected: [7, 8 - Note.MIN_DURATION, 7, 6],
        description:
          "reflects start times after clip end to the negative direction, ensuring notes near the clip end will play",
      },
      {
        input: [4, 5, 6, 7],
        clip: { start: 0, end: 8 },
        edgeBehavior: "reflect",
        range: 6,
        amount: -1,
        expected: [2, 1, 0, 1],
        description: "reflects start times before clip start to the positive direction",
      },
      {
        input: [4, 5, 6, 7],
        clip: { start: 4, end: 12 },
        edgeBehavior: "reflect",
        range: 7,
        amount: 1,
        expected: [11, 12 - Note.MIN_DURATION, 11, 10],
        description:
          "reflects start times after clip end to the negative direction, ensuring notes near the clip end will play",
      },
      {
        input: [5, 6, 7, 8],
        clip: { start: 4, end: 12 },
        edgeBehavior: "reflect",
        range: 3,
        amount: -1,
        expected: [6, 5, 4, 5],
        description: "reflects start times before clip start to the positive direction",
      },
      {
        input: [0, 1, 2, 3],
        clip: { start: 0, end: 8 },
        edgeBehavior: "remove",
        range: 7,
        amount: 1,
        expected: [7, 8, 9, 10],
        description: "allows start times to go after clip end",
      },
      {
        input: [0, 1, 2, 3],
        clip: { start: 0, end: 8 },
        edgeBehavior: "remove",
        range: 2,
        amount: -1,
        expected: [-2, -1, 0, 1],
        description: "allows start times to go before clip start",
      },
      {
        input: [4, 5, 6, 7],
        clip: { start: 4, end: 12 },
        edgeBehavior: "remove",
        range: 7,
        amount: 1,
        expected: [11, 12, 13, 14],
        description: "allows start times to go after clip end",
      },
      {
        input: [4, 5, 6, 7],
        clip: { start: 4, end: 12 },
        edgeBehavior: "remove",
        range: 2,
        amount: -1,
        expected: [2, 3, 4, 5],
        description: "allows start times to go before clip start",
      },
    ],
    //==================================================================================================================
    duration: [
      {
        input: [0.5, 1, 2],
        range: 2,
        amount: 0.5,
        expected: [1.5, 2, 3],
      },
      {
        input: [0.5, 1, 2],
        range: 1,
        amount: -0.25,
        expected: [0.25, 0.75, 1.75],
      },
      {
        input: [0.5, 0.99, 1, 1.5],
        clip: { start: 0, end: 2 }, // length == 2
        edgeBehavior: "clamp",
        range: 1,
        amount: 1,
        expected: [1.5, 1.99, 2, 2],
        description: "clamps durations to a maximum of the clip length",
      },
      {
        input: [0.5, 0.99, 1, 1.5],
        clip: { start: 2, end: 4 }, // length == 2
        edgeBehavior: "clamp",
        range: 1,
        amount: 1,
        expected: [1.5, 1.99, 2, 2],
        description: "clamps durations to a maximum of the clip length",
      },
      {
        input: [0.5, 1, 1.01, 1.5],
        edgeBehavior: "clamp",
        range: 1,
        amount: -1,
        expected: [Note.MIN_DURATION, Note.MIN_DURATION, 1.01 - 1, 0.5],
        description: "clamps durations to a minimum of Note.MIN_DURATION",
      },
      {
        input: [0.5, 1, 1.5],
        clip: { start: 0, end: 2 }, // length == 2
        edgeBehavior: "rotate",
        range: 1,
        amount: 1,
        expected: [1.5, Note.MIN_DURATION, 0.5],
        description:
          "wraps durations around from clip.length to 0 in the positive direction and ensures the Note.MIN_DURATION",
      },
      {
        input: [0.5, 1, 1.5],
        clip: { start: 2, end: 4 }, // length == 2
        edgeBehavior: "rotate",
        range: 1,
        amount: 1,
        expected: [1.5, Note.MIN_DURATION, 0.5],
        description:
          "wraps durations around from clip.length to 0 in the positive direction and ensures the Note.MIN_DURATION",
      },
      {
        input: [1.5, 1, 0.5],
        clip: { start: 0, end: 2 }, // length == 2
        edgeBehavior: "rotate",
        range: 1,
        amount: -1,
        expected: [0.5, Note.MIN_DURATION, 1.5],
        description:
          "wraps durations around from 0 to clip.length in the negative direction and ensures the Note.MIN_DURATION",
      },
      {
        input: [1.5, 1, 0.5],
        clip: { start: 2, end: 4 }, // length == 2
        edgeBehavior: "rotate",
        range: 1,
        amount: -1,
        expected: [0.5, Note.MIN_DURATION, 1.5],
        description:
          "wraps durations around from 0 to clip.length in the negative direction and ensures the Note.MIN_DURATION",
      },
      {
        input: [0.9, 1, 1.1, 2],
        clip: { start: 0, end: 2 }, // length == 2
        edgeBehavior: "reflect",
        range: 1,
        amount: 1,
        expected: [1.9, 2, 1.9, 1],
        description: "reflects durations above clip.length to the negative direction",
      },
      {
        input: [0.9, 1, 1.1, 2],
        clip: { start: 2, end: 4 }, // length == 2
        edgeBehavior: "reflect",
        range: 1,
        amount: 1,
        expected: [1.9, 2, 1.9, 1],
        description: "reflects durations above clip.length to the negative direction",
      },
      {
        input: [0.75, 1, 1.25, 2],
        clip: { start: 0, end: 2 }, // length == 2
        edgeBehavior: "reflect",
        range: 1,
        amount: -1,
        expected: [0.25, Note.MIN_DURATION, 0.25, 1],
        description: "reflects durations below 0 to the positive direction and ensures the Note.MIN_DURATION",
      },
      {
        input: [0.75, 1, 1.25, 2],
        clip: { start: 2, end: 4 }, // length == 2
        edgeBehavior: "reflect",
        range: 1,
        amount: -1,
        expected: [0.25, Note.MIN_DURATION, 0.25, 1],
        description: "reflects durations below 0 to the positive direction and ensures the Note.MIN_DURATION",
      },
      {
        input: [0.5, 1, 2],
        edgeBehavior: "remove",
        range: 100,
        amount: 1,
        expected: [100.5, 101, 102],
        description: "imposes no max on durations",
      },
      {
        input: [0.5, 1, 1.0001, 1 + Note.MIN_DURATION, 2],
        edgeBehavior: "remove",
        range: 1,
        amount: -1,
        expected: [
          { duration: -0.5, deleted: true },
          { duration: 0, deleted: true },
          { duration: 0.00009999999999998899, deleted: true }, // should be 0.0001, but there's floating point round-off error
          Note.MIN_DURATION,
          1,
        ],
        description: "soft-deletes notes shorter than Note.MIN_DURATION",
      },
    ],
  });
  // TODO: test degenerate cases where no transformation happens? like amount 0 and complete wrap-around
  // TODO: test cases where note properties already start out of bounds (w.r.t. edge behavior, e.g. duration longer than clip.length)
  // TODO: test randomize2D()
});
