import assert from "assert";
import { SlideTransformer, Note } from "../src";

export function makeNotes(...values) {
  return values.map((val) => new Note({ start: val, pitch: val, velocity: val, duration: val }));
}

// "Map" notes by destructively modifying clones in a forEach
export function mapNotes(notes, map) {
  const mapped = cloneAll(notes);
  mapped.forEach(map);
  return mapped;
}

export function cloneAll(cloneables) {
  return cloneables.map((c) => c.clone());
}

export const defaultClip = Object.freeze({ start: 0, end: 16, length: 16 });

function describeSlideTransformerTest({ operation, noteProperty, range, amount, edgeBehavior, anchor, unlockEnd, tension, clip, description }) {
  const baseDescription = description || `${operation}s the ${noteProperty} as expected`;
  return `${baseDescription} for ${Object.entries({ range, amount, edgeBehavior, anchor, unlockEnd, tension, clip })
    .filter(([_, value]) => value != null)
    .map(([name, value]) => `${name}=${JSON.stringify(value)}`)
    .join(", ")}`;
}

function setupSlideTransformer({ notes, input, noteProperty, range, edgeBehavior, anchor, unlockEnd, tension, clip }) {
  const slideTransformer = new SlideTransformer();
  slideTransformer.notes = notes || input.map((value) => new Note({ [noteProperty]: value }));
  slideTransformer.setRange(noteProperty, range);
  if (edgeBehavior) {
    slideTransformer.edgeBehavior = edgeBehavior;
  }
  if (anchor) {
    slideTransformer.spreadAnchor = anchor;
  }
  if (unlockEnd) {
    slideTransformer.strumUnlockEnd = unlockEnd;
  }
  if (tension) {
    slideTransformer.tension = tension;
  }
  const c = clip || defaultClip;
  if (!c.length) c.length = c.end - c.start;
  slideTransformer.clip = c;
  return slideTransformer;
}

export function runSlideTransformerTests(operation, testCases) {
  Object.entries(testCases).forEach(([noteProperty, tests]) => {
    describe(`${operation}('${noteProperty}', amount)`, () => {
      it("is idempotent", () => {
        const test = { operation, noteProperty, ...tests[0] };
        const slideTransformer = setupSlideTransformer(test);
        const inputNotes = test.input.map((value) => new Note({ [noteProperty]: value }));

        // make a copy so it can't be destructively modified on the second transformation:
        const actualNotes1 = slideTransformer[operation](noteProperty, test.amount).map((note) => note.clone());
        const actualNotes2 = slideTransformer[operation](noteProperty, test.amount);

        assert.notDeepStrictEqual(actualNotes1, inputNotes); // check that a transformation happened
        assert.deepStrictEqual(actualNotes1, actualNotes2);
      });

      tests.forEach((testParams) => {
        const test = { operation, noteProperty, ...testParams };
        const runTest = testParams.skip ? it.skip : (testParams.only ? it.only : it);

        runTest(describeSlideTransformerTest(test), () => {
          const slideTransformer = setupSlideTransformer(test);
          const expectedNotes = test.expected.map((value) => {
            return new Note(value instanceof Object ? value : { [noteProperty]: value })
          });
          const actualNotes = slideTransformer[operation](noteProperty, test.amount);
          assert.deepStrictEqual(actualNotes, expectedNotes);
        });
      });
    });
  });
}

export function runStrumTests(testCases) {
  const operation = 'strum';

  Object.entries(testCases).forEach(([noteProperty, tests]) => {

    describe(`${operation}('${noteProperty}', amount)`, () => {
      it("is idempotent", () => {
        const notes = tests[0].notes.map(noteParams => new Note(noteParams));
        const test = { operation, ...tests[0], notes };
        const slideTransformer = setupSlideTransformer({ ...test, noteProperty: 'strum' });

        // make a copy so it can't be destructively modified on the second transformation:
        const actualNotes1 = slideTransformer[operation](noteProperty, test.amount).map((note) => note.clone());
        const actualNotes2 = slideTransformer[operation](noteProperty, test.amount);

        assert.notDeepStrictEqual(actualNotes1, tests); // check that a transformation happened
        assert.deepStrictEqual(actualNotes1, actualNotes2);
      });

      tests.forEach((testParams) => {
        const notes = testParams.notes.map(noteParams => new Note(noteParams));
        const test = { operation, noteProperty, ...testParams, notes };
        const runTest = testParams.skip ? it.skip : (testParams.only ? it.only : it);

        runTest(describeSlideTransformerTest(test), () => {
          const slideTransformer = setupSlideTransformer({ ...test, noteProperty: 'strum' });
          const expectedNotes = test.expected.map((value, index) => {
            if (value instanceof Object) {
              return new Note({
                ...notes[index]?.toJSON(),
                ...value
              })
            }
            else {
              return new Note({
                ...notes[index]?.toJSON(),
                [noteProperty]: value
              })
            }
          });
          const actualNotes = slideTransformer[operation](noteProperty, test.amount);
          assert.deepStrictEqual(actualNotes, expectedNotes);
        });
      });
    });
  });
}
