import { Note } from '../../src';
import { runSlideTransformerTests } from '../helpers';

describe('SlideTransformer.spread', () => {
  runSlideTransformerTests('spread', {
    pitch: [
      {
        input: [10, 11, 12, 13],
        range: 12,
        amount: 0.5,
        expected: [4, 9, 14, 19]
      },
      {
        input: [4, 7, 10, 13],
        range: 12,
        amount: -0.25,
        expected: [7, 8, 9, 10]
      },
      // TODO: anchor behaviors, edge behaviors
    ],
    //==================================================================================================================
    velocity: [
      {
        input: [10, 11, 12, 13],
        range: 12,
        amount: 0.5,
        expected: [4, 9, 14, 19]
      },
      {
        input: [4, 7, 10, 13],
        range: 12,
        amount: -0.25,
        expected: [7, 8, 9, 10]
      },
      // TODO: anchor behaviors, edge behaviors
    ],
    //==================================================================================================================
    start: [
      {
        input: [10, 11, 12, 13],
        clip: { start: 0, end: 32 },
        range: 12,
        amount: 0.5,
        expected: [4, 9, 14, 19]
      },
      {
        input: [4, 7, 10, 13],
        range: 12,
        amount: -0.25,
        expected: [7, 8, 9, 10]
      },
      // TODO: anchor behaviors, edge behaviors
    ],
    //==================================================================================================================
    duration: [
      {
        input: [10, 11, 12, 13],
        clip: { start: 0, end: 32 },
        range: 12,
        amount: 0.5,
        expected: [4, 9, 14, 19]
      },
      {
        input: [4, 7, 10, 13],
        range: 12,
        amount: -0.25,
        expected: [7, 8, 9, 10]
      },
      // TODO: anchor behaviors, edge behaviors
    ],

    // TODO: test degenerate cases where no transformation happens? like amount 0 and complete wrap-around
    // TODO: test cases where note properties already start out of bounds (w.r.t. edge behavior, e.g. duration longer than clip.length)
    // TODO: test randomize2D()
  });
});
