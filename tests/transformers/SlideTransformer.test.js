import assert from 'assert';
import { SlideTransformer, Note, ANCHOR } from '../../src';
import { makeNotes, cloneAll, mapNotes } from '../helpers';

describe('SlideTransformer', () => {
  // TODO: delete the old setup code once all the tests are data driven
  let slideTransformer;
  let notes;
  let clip;
  beforeEach(() => {
    slideTransformer = new SlideTransformer();
    notes = makeNotes(10, 11, 12, 13);
    slideTransformer.notes = notes;
    clip = { start: 4, end: 20, length: 16 };
    slideTransformer.clip = clip;
  });

  const defaultClip = { start: 0, end: 16 };

  const testCases = {
    shift: {
      pitch: [
        {
          input: [10, 11, 12, 13],
          range: 20,
          amount: 0.5,
          expected: [20, 21, 22, 23]
        },
        {
          input: [10, 11, 12, 13],
          range: 20,
          amount: -0.25,
          expected: [5, 6, 7, 8]
        },
        {
          input: [10, 11, 12, 13],
          edgeBehavior: 'clamp',
          range: 116,
          amount: 1,
          expected: [126, 127, 127, 127],
          description: 'clamps to a max pitch of 127',
        },
        {
          input: [10, 11, 12, 13],
          edgeBehavior: 'clamp',
          range: 12,
          amount: -1,
          expected: [0, 0, 0, 1],
          description: 'clamps to a min pitch of 0'
        },
        {
          input: [10, 11, 12, 13],
          edgeBehavior: 'reflect',
          range: 116,
          amount: 1,
          expected: [126, 127, 126, 125],
          description: 'reflects pitches above 127 to the negative direction',
        },
        {
          input: [10, 11, 12, 13],
          edgeBehavior: 'reflect',
          range: 12,
          amount: -1,
          expected: [2, 1, 0, 1],
          description: 'reflects pitches below 0 to the positive direction',
        },
        {
          input: [10, 11, 12, 13],
          edgeBehavior: 'remove',
          range: 116,
          amount: 1,
          expected: [126, 127],
          description: 'removes notes with pitches above 127',
        },
        {
          input: [10, 11, 12, 13],
          edgeBehavior: 'remove',
          range: 12,
          amount: -1,
          expected: [0, 1],
          description: 'removes notes with pitches below 0',
        },
        {
          input: [10, 11, 12, 13],
          edgeBehavior: 'rotate',
          range: 116,
          amount: 1,
          expected: [126, 127, 0, 1],
          description: 'wraps pitches around from 127 to 0 in the positive direction',
        },
        {
          input: [10, 11, 12, 13],
          edgeBehavior: 'rotate',
          range: 12,
          amount: -1,
          expected: [126, 127, 0, 1],
          description: 'wraps pitches around from 0 to 127 in the negative direction',
        },
      ],
      //-----------------------------------------------------------------------
      velocity: [
        {
          input: [10, 11, 12, 13],
          range: 20,
          amount: 0.5,
          expected: [20, 21, 22, 23]
        },
        {
          input: [10, 11, 12, 13],
          range: 20,
          amount: -0.25,
          expected: [5, 6, 7, 8]
        },
        {
          input: [10, 11, 12, 13],
          edgeBehavior: 'clamp',
          range: 116,
          amount: 1,
          expected: [126, 127, 127, 127],
          description: 'clamps to a max velocity of 127',
        },
        {
          input: [10, 11, 12, 13],
          edgeBehavior: 'clamp',
          range: 12,
          amount: -1,
          expected: [0, 0, 0, 1],
          description: 'clamps to a min velocity of 0'
        },
        {
          input: [10, 11, 12, 13],
          edgeBehavior: 'reflect',
          range: 116,
          amount: 1,
          expected: [126, 127, 126, 125],
          description: 'reflects velocities above 127 to the negative direction',
        },
        {
          input: [10, 11, 12, 13],
          edgeBehavior: 'reflect',
          range: 12,
          amount: -1,
          expected: [2, 1, 0, 1],
          description: 'reflects velocities below 0 to the positive direction',
        },
        { // This is a special case to not remove notes that get "too loud", which felt very non-intuitive
          input: [10, 11, 12, 13],
          edgeBehavior: 'remove',
          range: 116,
          amount: 1,
          expected: [126, 127, 127, 127],
          description: 'does not remove notes with velocities above 127 and just clamps them to 127',
        },
        {
          input: [10, 11, 12, 13],
          edgeBehavior: 'remove',
          range: 12,
          amount: -1,
          expected: [0, 1],
          description: 'removes notes with velocities below 0',
        },
        {
          input: [10, 11, 12, 13],
          edgeBehavior: 'rotate',
          range: 116,
          amount: 1,
          expected: [126, 127, 0, 1],
          description: 'wraps velocities around from 127 to 0 in the positive direction',
        },
        {
          input: [10, 11, 12, 13],
          edgeBehavior: 'rotate',
          range: 12,
          amount: -1,
          expected: [126, 127, 0, 1],
          description: 'wraps velocities around from 0 to 127 in the negative direction',
        },
      ],
      //-----------------------------------------------------------------------
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
          edgeBehavior: 'clamp',
          range: 6,
          amount: 1,
          expected: [6, 7, (8 - Note.MIN_DURATION), (8 - Note.MIN_DURATION)],
          description: 'clamps start time to the clip end minus a small amount (so the note can play)',
        },
        {
          input: [4, 5, 6, 7],
          clip: { start: 4, end: 12 },
          edgeBehavior: 'clamp',
          range: 6,
          amount: 1,
          expected: [10, 11, (12 - Note.MIN_DURATION), (12 - Note.MIN_DURATION)],
          description: 'clamps start time to the clip end minus a small amount (so the note can play)',
        },
        {
          input: [1, 2, 3, 4],
          clip: { start: 0, end: 8 },
          edgeBehavior: 'clamp',
          range: 3,
          amount: -1,
          expected: [0, 0, 0, 1],
          description: 'clamps start time to the clip start',
        },
        {
          input: [5, 6, 7, 8],
          clip: { start: 4, end: 12 },
          edgeBehavior: 'clamp',
          range: 3,
          amount: -1,
          expected: [4, 4, 4, 5],
          description: 'clamps start time to the clip start',
        },
        {
          input: [0, 1, 2, 3],
          clip: { start: 0, end: 8 },
          edgeBehavior: 'rotate',
          range: 6,
          amount: 1,
          expected: [6, 7, 0, 1],
          description: 'wraps start times around from clip end to clip start',
        },
        {
          input: [4, 5, 6, 7],
          clip: { start: 4, end: 12 },
          edgeBehavior: 'rotate',
          range: 6,
          amount: 1,
          expected: [10, 11, 4, 5],
          description: 'wraps start times around from clip end to clip start',
        },
        {
          input: [0, 1, 2, 3],
          clip: { start: 0, end: 8 },
          edgeBehavior: 'rotate',
          range: 2,
          amount: -1,
          expected: [6, 7, 0, 1],
          description: 'wraps start times around from clip start to clip end',
        },
        {
          input: [4, 5, 6, 7],
          clip: { start: 4, end: 12 },
          edgeBehavior: 'rotate',
          range: 2,
          amount: -1,
          expected: [10, 11, 4, 5],
          description: 'wraps start times around from clip end to clip start',
        },
        {
          input: [0, 1, 2, 3],
          clip: { start: 0, end: 8 },
          edgeBehavior: 'reflect',
          range: 7,
          amount: 1,
          expected: [7, 8 - Note.MIN_DURATION, 7, 6],
          description: 'reflects start times after clip end to the negative direction, ensuring notes near the clip end will play',
        },
        {
          input: [4, 5, 6, 7],
          clip: { start: 0, end: 8 },
          edgeBehavior: 'reflect',
          range: 6,
          amount: -1,
          expected: [2, 1, 0, 1],
          description: 'reflects start times before clip start to the positive direction',
        },
        {
          input: [4, 5, 6, 7],
          clip: { start: 4, end: 12 },
          edgeBehavior: 'reflect',
          range: 7,
          amount: 1,
          expected: [11, 12 - Note.MIN_DURATION, 11, 10],
          description: 'reflects start times after clip end to the negative direction, ensuring notes near the clip end will play',
        },
        {
          input: [5, 6, 7, 8],
          clip: { start: 4, end: 12 },
          edgeBehavior: 'reflect',
          range: 3,
          amount: -1,
          expected: [6, 5, 4, 5],
          description: 'reflects start times before clip start to the positive direction',
        },
        {
          input: [0, 1, 2, 3],
          clip: { start: 0, end: 8 },
          edgeBehavior: 'remove',
          range: 7,
          amount: 1,
          expected: [7, 8, 9, 10],
          description: 'allows start times to go after clip end',
        },
        {
          input: [0, 1, 2, 3],
          clip: { start: 0, end: 8 },
          edgeBehavior: 'remove',
          range: 2,
          amount: -1,
          expected: [-2, -1, 0, 1],
          description: 'allows start times to go before clip start',
        },
        {
          input: [4, 5, 6, 7],
          clip: { start: 4, end: 12 },
          edgeBehavior: 'remove',
          range: 7,
          amount: 1,
          expected: [11, 12, 13, 14],
          description: 'allows start times to go after clip end',
        },
        {
          input: [4, 5, 6, 7],
          clip: { start: 4, end: 12 },
          edgeBehavior: 'remove',
          range: 2,
          amount: -1,
          expected: [2, 3, 4, 5],
          description: 'allows start times to go before clip start',
        },
      ],
      //-----------------------------------------------------------------------
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
          edgeBehavior: 'clamp',
          range: 1,
          amount: 1,
          expected: [1.5, 1.99, 2, 2],
          description: 'clamps durations to a maximum of the clip length',
        },
        {
          input: [0.5, 0.99, 1, 1.5],
          clip: { start: 2, end: 4 }, // length == 2
          edgeBehavior: 'clamp',
          range: 1,
          amount: 1,
          expected: [1.5, 1.99, 2, 2],
          description: 'clamps durations to a maximum of the clip length',
        },
        {
          input: [0.5, 1, 1.01, 1.5],
          edgeBehavior: 'clamp',
          range: 1,
          amount: -1,
          expected: [Note.MIN_DURATION, Note.MIN_DURATION, (1.01 - 1), 0.5],
          description: 'clamps durations to a minimum of Note.MIN_DURATION',
        },
        {
          input: [0.5, 1, 1.5],
          clip: { start: 0, end: 2 }, // length == 2
          edgeBehavior: 'rotate',
          range: 1,
          amount: 1,
          expected: [1.5, Note.MIN_DURATION, 0.5],
          description: 'wraps durations around from clip.length to 0 in the positive direction and ensures the Note.MIN_DURATION',
        },
        {
          input: [0.5, 1, 1.5],
          clip: { start: 2, end: 4 }, // length == 2
          edgeBehavior: 'rotate',
          range: 1,
          amount: 1,
          expected: [1.5, Note.MIN_DURATION, 0.5],
          description: 'wraps durations around from clip.length to 0 in the positive direction and ensures the Note.MIN_DURATION',
        },
        {
          input: [1.5, 1, 0.5],
          clip: { start: 0, end: 2 }, // length == 2
          edgeBehavior: 'rotate',
          range: 1,
          amount: -1,
          expected: [0.5, Note.MIN_DURATION, 1.5],
          description: 'wraps durations around from 0 to clip.length in the negative direction and ensures the Note.MIN_DURATION',
        },
        {
          input: [1.5, 1, 0.5],
          clip: { start: 2, end: 4 }, // length == 2
          edgeBehavior: 'rotate',
          range: 1,
          amount: -1,
          expected: [0.5, Note.MIN_DURATION, 1.5],
          description: 'wraps durations around from 0 to clip.length in the negative direction and ensures the Note.MIN_DURATION',
        },
        {
          input: [0.9, 1, 1.1, 2],
          clip: { start: 0, end: 2 }, // length == 2
          edgeBehavior: 'reflect',
          range: 1,
          amount: 1,
          expected: [1.9, 2, 1.9, 1],
          description: 'reflects durations above clip.length to the negative direction',
        },
        {
          input: [0.9, 1, 1.1, 2],
          clip: { start: 2, end: 4 }, // length == 2
          edgeBehavior: 'reflect',
          range: 1,
          amount: 1,
          expected: [1.9, 2, 1.9, 1],
          description: 'reflects durations above clip.length to the negative direction',
        },
        {
          input: [0.75, 1, 1.25, 2],
          clip: { start: 0, end: 2 }, // length == 2
          edgeBehavior: 'reflect',
          range: 1,
          amount: -1,
          expected: [0.25, Note.MIN_DURATION, 0.25, 1],
          description: 'reflects durations below 0 to the positive direction and ensures the Note.MIN_DURATION',
        },
        {
          input: [0.75, 1, 1.25, 2],
          clip: { start: 2, end: 4 }, // length == 2
          edgeBehavior: 'reflect',
          range: 1,
          amount: -1,
          expected: [0.25, Note.MIN_DURATION, 0.25, 1],
          description: 'reflects durations below 0 to the positive direction and ensures the Note.MIN_DURATION',
        },
        {
          input: [0.5, 1, 2],
          edgeBehavior: 'remove',
          range: 100,
          amount: 1,
          expected: [100.5, 101, 102],
          description: 'imposes no max on durations',
        },
        {
          input: [0.5, 1, 1 + Note.MIN_DURATION, 2],
          edgeBehavior: 'remove',
          range: 1,
          amount: -1,
          expected: [Note.MIN_DURATION, 1],
          description: 'removes notes shorter than Note.MIN_DURATION',
        },
        // TODO: spread
        // TODO: remove old setup code
        // TODO: degenerate cases where no transformation happens? like amount 0 and complete wrap-around
        // TODO: cases where note properties already start out of bounds (w.r.t. edge behavior, e.g. duration longer than clip.length)
        // TODO: split this test up into multiple files, probably need to refactor helpers
      ]
    },
  };

  function describeTest({ operation, noteProperty, range, amount, edgeBehavior, clip, description }) {
    const baseDescription = description || `${operation}s the ${noteProperty} as expected`;
    return `${baseDescription} for ${Object.entries({ range, amount, edgeBehavior, clip })
      .filter(([_, value]) => value != null)
      .map(([name, value]) => `${name}=${JSON.stringify(value)}`)
      .join(', ')}`;
  }

  function setupSlideTransformer({ input, noteProperty, range, edgeBehavior, clip }) {
    const slideTransformer = new SlideTransformer();
    slideTransformer.notes = input.map((value) => new Note({ [noteProperty]: value }));
    slideTransformer.setRange(noteProperty, range);
    if (edgeBehavior) {
      slideTransformer.edgeBehavior = edgeBehavior;
    }
    const c = clip || defaultClip;
    c.length = c.end - c.start;
    slideTransformer.clip = c;
    return slideTransformer;
  }

  Object.entries(testCases).forEach(([operation, testsForNoteProperty]) => {
    Object.entries(testsForNoteProperty).forEach(([noteProperty, tests]) => {
      describe(`${operation}('${noteProperty}', amount)`, () => {

        it('is idempotent', () => {
          const test = { operation, noteProperty, ...tests[0] };
          const slideTransformer = setupSlideTransformer(test);
          const inputNotes = test.input.map((value) => new Note({ [noteProperty]: value }));
          const actualNotes1 = slideTransformer[operation](noteProperty, test.amount);
          const actualNotes2 = slideTransformer[operation](noteProperty, tests.amount);
          assert.notDeepStrictEqual(actualNotes1, inputNotes); // check that a transformation happpened
          assert.deepStrictEqual(actualNotes1, actualNotes2);
        });

        tests.forEach((testParams) => {
          const test = { operation, noteProperty, ...testParams };
          it(describeTest(test), () => {
            const slideTransformer = setupSlideTransformer(test);
            const expectedNotes = test.expected.map((value) => new Note({ [noteProperty]: value }));
            const actualNotes = slideTransformer[operation](noteProperty, test.amount);
            assert.deepStrictEqual(
              actualNotes,
              expectedNotes,
            );
          });
        });
      });
    });
  });

  describe('spread()', () => {
    it('is idempotent', () => {
      slideTransformer.setRange('pitch', 6);
      const actual1 = slideTransformer.spread('pitch', 1);
      const expected = mapNotes(notes, note => {
        switch (note.pitch) {
          case 10: return note.pitch = 4;
          case 11: return note.pitch = 9;
          case 12: return note.pitch = 14;
          case 13: return note.pitch = 19;
        }
      });
      assert.deepStrictEqual(actual1, expected);
      const actual2 = slideTransformer.spread('pitch', 1);
      assert.deepStrictEqual(actual2, expected);
    });

    describe("spread('pitch', amount)", () => {
      it('spreads pitches apart by the given range with a positive amount', () => {
        slideTransformer.setRange('pitch', 12);
        assert.deepStrictEqual(
          slideTransformer.spread('pitch', 0.5),
          mapNotes(notes, note => {
            switch (note.pitch) {
              case 10: return note.pitch = 4;
              case 11: return note.pitch = 9;
              case 12: return note.pitch = 14;
              case 13: return note.pitch = 19;
            }
          })
        );
      });

      it('squeezes pitches closer together with a negative amount', () => {
        notes = makeNotes(4, 7, 10, 13);
        slideTransformer.notes = notes;
        slideTransformer.setRange('pitch', 12);
        assert.deepStrictEqual(
          slideTransformer.spread('pitch', -0.25),
          mapNotes(notes, note => {
            switch (note.pitch) {
              case 4: return note.pitch = 7;
              case 7: return note.pitch = 8;
              case 10: return note.pitch = 9;
              case 13: return note.pitch = 10;
            }
          })
        );
      });

      // TODO
      // tests for slideTransformer.spreadAnchor = ANCHOR.MIN/MIDPOINT/MAX
      // spot check other note properties
      // spot check edge behaviors
      // implement "tie-breaker" mechanism for strumming and test that
    });
  });

  describe('randomize2D()', () => {
    // TODO:

    // Maybe we don't need to retest every edge behavior since it should behave the same way

    // it('is idempotent', () => { });
  });
});
