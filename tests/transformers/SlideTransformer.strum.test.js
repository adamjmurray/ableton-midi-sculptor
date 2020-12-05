import { Note } from "../../src";
import { runStrumTests } from "../helpers";

describe("SlideTransformer.strum", () => {
  runStrumTests([
    {
      notes: [
        { pitch: 1, start: 0 },
        { pitch: 2, start: 0 },
        { pitch: 3, start: 0 },
        { pitch: 4, start: 0 },
        { pitch: 5, start: 0 },
      ],
      range: 1,
      amount: 1,
      anchor: "min",
      unlockEnd: true,
      expected: [0, 0.25, 0.5, 0.75, 1],
    },
    {
      notes: [
        { pitch: 1, start: 0 },
        { pitch: 10, start: 0 },
        { pitch: 30, start: 0 },
        { pitch: 60, start: 0 },
        { pitch: 120, start: 0 },
      ],
      range: 1,
      amount: 1,
      anchor: "min",
      unlockEnd: true,
      expected: [0, 0.25, 0.5, 0.75, 1],
    },
    {
      notes: [
        { pitch: 1, start: 0 },
        { pitch: 2, start: 1 },
        { pitch: 3, start: 2 },
        { pitch: 4, start: 3 },
        { pitch: 5, start: 4 },
      ],
      range: 1,
      amount: 1,
      anchor: "min",
      unlockEnd: true,
      expected: [0, 1.25, 2.5, 3.75, 5],
    },
    {
      notes: [
        { pitch: 1, start: 2 },
        { pitch: 2, start: 2 },
        { pitch: 3, start: 2 },
        { pitch: 4, start: 2 },
        { pitch: 5, start: 2 },
      ],
      range: 2,
      amount: -1,
      anchor: "min",
      unlockEnd: true,
      expected: [2, 1.5, 1, 0.5, 0],
    },
    {
      notes: [
        { pitch: 1, start: 0 },
        { pitch: 2, start: 0 },
        { pitch: 3, start: 0 },
        { pitch: 4, start: 0 },
        { pitch: 5, start: 0 },
      ],
      range: 1,
      amount: 1,
      anchor: "max",
      unlockEnd: true,
      expected: [1, 0.75, 0.5, 0.25, 0],
    },
    {
      notes: [
        { pitch: 1, start: 2 },
        { pitch: 2, start: 2 },
        { pitch: 3, start: 2 },
        { pitch: 4, start: 2 },
        { pitch: 5, start: 2 },
      ],
      range: 4,
      amount: 1,
      anchor: "mid",
      unlockEnd: true,
      expected: [0, 1, 2, 3, 4],
    },
    {
      notes: [
        { pitch: 1, start: 2 },
        { pitch: 2, start: 2 },
        { pitch: 3, start: 2 },
        { pitch: 4, start: 2 },
        { pitch: 5, start: 2 },
      ],
      range: 4,
      amount: -1,
      anchor: "mid",
      unlockEnd: true,
      expected: [4, 3, 2, 1, 0],
    },
    {
      notes: [
        { pitch: 1, start: 0, duration: 2 },
        { pitch: 2, start: 0, duration: 2 },
        { pitch: 3, start: 0, duration: 2 },
        { pitch: 4, start: 0, duration: 2 },
        { pitch: 5, start: 0, duration: 2 },
      ],
      range: 1,
      amount: 1,
      anchor: "min",
      unlockEnd: false,
      expected: [
        { start: 0, duration: 2 },
        { start: 0.25, duration: 1.75 },
        { start: 0.5, duration: 1.5 },
        { start: 0.75, duration: 1.25 },
        { start: 1, duration: 1 }
      ],
    },
    {
      notes: [
        { pitch: 1, start: 0, duration: 1 },
        { pitch: 2, start: 0, duration: 1 },
        { pitch: 3, start: 0, duration: 1 },
        { pitch: 4, start: 0, duration: 1 },
        { pitch: 5, start: 0, duration: 1 },
      ],
      range: 1,
      amount: 1,
      anchor: "min",
      unlockEnd: false,
      expected: [
        { start: 0, duration: 1 },
        { start: 0.25, duration: 0.75 },
        { start: 0.5, duration: 0.5 },
        { start: 0.75, duration: 0.25 },
        { start: 1 - Note.MIN_DURATION, duration: Note.MIN_DURATION },
      ],
    },
    {
      notes: [
        { pitch: 1, start: 0, duration: 1 },
        { pitch: 2, start: 0.5, duration: 0.5 },
        { pitch: 3, start: 1, duration: 1 },
      ],
      range: 1,
      amount: 1,
      anchor: "min",
      unlockEnd: false,
      expected: [
        { start: 0, duration: 1 },
        { start: 1 - Note.MIN_DURATION, duration: Note.MIN_DURATION },
        { start: 2 - Note.MIN_DURATION, duration: Note.MIN_DURATION },
      ],
    },
    // TODO:
    // tension positive
    // tension negative
    // clamp min
    // clamp max
    // reflect min
    // reflect max
    // remove min
    // remove max
    // rotate min
    // rotate max
    // duration (end time)
    // - min anchor positive
    // - min anchor negative
    // - max anchor positive
    // - max anchor negative
    // - mid anchor positive
    // - mid anchor negative
    // - etc
  ]);
});
