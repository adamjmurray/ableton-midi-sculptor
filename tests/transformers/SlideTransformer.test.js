import assert from 'assert';
import { SlideTransformer, Note, ANCHOR } from '../../src';
import { makeNotes, cloneAll, mapNotes } from '../helpers';

describe('SlideTransformer', () => {
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

  describe('shift()', () => {
    it('is idempotent', () => {
      slideTransformer.setRange('pitch', 20);
      const actual1 = slideTransformer.shift('pitch', 0.5);
      const expected = mapNotes(notes, note => note.pitch += 10)
      assert.deepStrictEqual(actual1, expected);
      const actual2 = slideTransformer.shift('pitch', 0.5);
      assert.deepStrictEqual(actual2, expected);
    });

    describe("shift('pitch', amount)", () => {
      it('shifts pitches by the given range and positive amount ratio', () => {
        slideTransformer.setRange('pitch', 20);
        assert.deepStrictEqual(
          slideTransformer.shift('pitch', 0.5),
          mapNotes(notes, note => note.pitch += 10)
        );
      });

      it('shifts pitches by the given range and negative amount ratio', () => {
        slideTransformer.setRange('pitch', 20);
        assert.deepStrictEqual(
          slideTransformer.shift('pitch', -0.25),
          mapNotes(notes, note => note.pitch -= 5)
        );
      });

      describe("edgeBehavior = 'clip'", () => {
        beforeEach(() => slideTransformer.edgeBehavior = 'clip');

        it("clamps pitches to a max of 127", () => {
          slideTransformer.setRange('pitch', 116);
          assert.deepStrictEqual(
            slideTransformer.shift('pitch', 1.0),
            mapNotes(notes, (note, index) => note.pitch = index === 0 ? 126 : 127)
          );
        });

        it("clamps pitches to a min of 0", () => {
          slideTransformer.setRange('pitch', 12);
          assert.deepStrictEqual(
            slideTransformer.shift('pitch', -1.0),
            mapNotes(notes, (note, index) => note.pitch = index < 3 ? 0 : 1)
          );
        });
      });

      describe("edgeBehavior = 'rotate'", () => {
        beforeEach(() => slideTransformer.edgeBehavior = 'rotate');

        it("wraps pitches around from 127 to 0 in the positive direction", () => {
          slideTransformer.setRange('pitch', 116);
          assert.deepStrictEqual(
            slideTransformer.shift('pitch', 1.0),
            mapNotes(notes, note => note.pitch = (note.pitch + 116) % 127)
          );
        });

        it("wraps pitches around from 0 to 127 in the negative direction", () => {
          slideTransformer.setRange('pitch', 12);
          assert.deepStrictEqual(
            slideTransformer.shift('pitch', -1.0),
            mapNotes(notes, (note) => note.pitch = (note.pitch + 127 - 12) % 127)
          );
        });
      });

      describe("edgeBehavior = 'reflect'", () => {
        beforeEach(() => slideTransformer.edgeBehavior = 'reflect');

        it("reflects pitches above 127 to the negative direction", () => {
          slideTransformer.setRange('pitch', 117);
          assert.deepStrictEqual(
            slideTransformer.shift('pitch', 1.0),
            mapNotes(notes, (note, index) => note.pitch = 127 - index)
          );
        });

        it("reflects pitches below 0 to the positive direction", () => {
          slideTransformer.setRange('pitch', 13);
          assert.deepStrictEqual(
            slideTransformer.shift('pitch', -1.0),
            mapNotes(notes, (note, index) => note.pitch = 3 - index)
          );
        });
      });

      describe("edgeBehavior = 'remove'", () => {
        beforeEach(() => slideTransformer.edgeBehavior = 'remove');

        it("removes notes with pitches above 127", () => {
          slideTransformer.setRange('pitch', 117);
          assert.deepStrictEqual(
            slideTransformer.shift('pitch', 1.0),
            // The remaining note had all properties set to 10:
            [new Note({ pitch: 127, start: 10, velocity: 10, duration: 10 })]
          );
        });

        it("removes notes with pitches below 0", () => {
          slideTransformer.setRange('pitch', 12);
          assert.deepStrictEqual(
            slideTransformer.shift('pitch', -1.0),
            [ // The remaining notes had all properties set to 12 and 13:
              new Note({ pitch: 0, start: 12, velocity: 12, duration: 12 }),
              new Note({ pitch: 1, start: 13, velocity: 13, duration: 13 }),
            ]
          );
        });
      });
    })

    describe("shift('velocity', amount)", () => {
      it('shifts velocities by the given range and positive amount ratio', () => {
        slideTransformer.setRange('velocity', 20);
        assert.deepStrictEqual(
          slideTransformer.shift('velocity', 0.5),
          mapNotes(notes, note => note.velocity += 10)
        );
      });

      it('shifts velocities by the given range and negative amount ratio', () => {
        slideTransformer.setRange('velocity', 20);
        assert.deepStrictEqual(
          slideTransformer.shift('velocity', -0.25),
          mapNotes(notes, note => note.velocity -= 5)
        );
      });

      describe("edgeBehavior = 'clip'", () => {
        beforeEach(() => slideTransformer.edgeBehavior = 'clip');

        it("clamps velocities to a max of 127", () => {
          slideTransformer.setRange('velocity', 116);
          assert.deepStrictEqual(
            slideTransformer.shift('velocity', 1.0),
            mapNotes(notes, (note, index) => note.velocity = index === 0 ? 126 : 127)
          );
        });

        it("clamps velocities to a min of 0", () => {
          slideTransformer.setRange('velocity', 12);
          assert.deepStrictEqual(
            slideTransformer.shift('velocity', -1.0),
            mapNotes(notes, (note, index) => note.velocity = index < 3 ? 0 : 1)
          );
        });
      });

      describe("edgeBehavior = 'rotate'", () => {
        beforeEach(() => slideTransformer.edgeBehavior = 'rotate');

        it("wraps velocities around from 127 to 0 in the positive direction", () => {
          slideTransformer.setRange('velocity', 116);
          assert.deepStrictEqual(
            slideTransformer.shift('velocity', 1.0),
            mapNotes(notes, note => note.velocity = (note.velocity + 116) % 127)
          );
        });

        it("wraps velocities around from 0 to 127 in the negative direction", () => {
          slideTransformer.setRange('velocity', 12);
          assert.deepStrictEqual(
            slideTransformer.shift('velocity', -1.0),
            mapNotes(notes, (note) => note.velocity = (note.velocity + 127 - 12) % 127)
          );
        });
      });

      describe("edgeBehavior = 'reflect'", () => {
        beforeEach(() => slideTransformer.edgeBehavior = 'reflect');

        it("reflects velocities above 127 to the negative direction", () => {
          slideTransformer.setRange('velocity', 117);
          assert.deepStrictEqual(
            slideTransformer.shift('velocity', 1.0),
            mapNotes(notes, (note, index) => note.velocity = 127 - index)
          );
        });

        it("reflects velocities below 0 to the positive direction", () => {
          slideTransformer.setRange('velocity', 13);
          assert.deepStrictEqual(
            slideTransformer.shift('velocity', -1.0),
            mapNotes(notes, (note, index) => note.velocity = 3 - index)
          );
        });
      });

      describe("edgeBehavior = 'remove'", () => {
        beforeEach(() => slideTransformer.edgeBehavior = 'remove');

        it("clamps velocities to a max of 127", () => {
          // This is a special case to not remove notes that get "too loud", which felt very non-intuitive
          slideTransformer.setRange('velocity', 116);
          assert.deepStrictEqual(
            slideTransformer.shift('velocity', 1.0),
            mapNotes(notes, (note, index) => note.velocity = index === 0 ? 126 : 127)
          );
        });

        it("removes notes with velocities below 0", () => {
          slideTransformer.setRange('velocity', 12);
          assert.deepStrictEqual(
            slideTransformer.shift('velocity', -1.0),
            [ // The remaining notes had all properties set to 12 and 13:
              new Note({ velocity: 0, pitch: 12, start: 12, duration: 12 }),
              new Note({ velocity: 1, pitch: 13, start: 13, duration: 13 }),
            ]
          );
        });
      });
    });

    describe("shift('start', amount)", () => {
      it('shifts start times by the given range and positive amount ratio', () => {
        slideTransformer.setRange('start', 10);
        assert.deepStrictEqual(
          slideTransformer.shift('start', 0.5),
          mapNotes(notes, note => note.start += 5)
        );
      });

      it('shifts start times by the given range and negative amount ratio', () => {
        slideTransformer.setRange('start', 20);
        assert.deepStrictEqual(
          slideTransformer.shift('start', -0.25),
          mapNotes(notes, note => note.start -= 5)
        );
      });

      describe("edgeBehavior = 'clip'", () => {
        beforeEach(() => slideTransformer.edgeBehavior = 'clip');

        it("clamps start times to a max of the clip end time", () => {
          slideTransformer.setRange('start', 9);
          assert.deepStrictEqual(
            slideTransformer.shift('start', 1.0),
            // MIN_DURATION is subtracted from the end of the clip so the note will be audible
            mapNotes(notes, (note, index) => note.start = index === 0 ? 19 : 20 - Note.MIN_DURATION)
          );
        });

        it("clamps start times to a min of the clip start time", () => {
          slideTransformer.setRange('start', 8);
          assert.deepStrictEqual(
            slideTransformer.shift('start', -1.0),
            mapNotes(notes, (note, index) => note.start = index < 3 ? 4 : 5)
          );
        });
      });

      describe("edgeBehavior = 'rotate'", () => {
        beforeEach(() => slideTransformer.edgeBehavior = 'rotate');

        it("wraps start times around from clip.end to clip.start in the positive direction", () => {
          slideTransformer.setRange('start', 8);
          assert.deepStrictEqual(
            slideTransformer.shift('start', 1.0),
            mapNotes(notes, (note, index) => {
              switch (index) {
                case 0: return note.start = 18;
                case 1: return note.start = 19;
                case 2: return note.start = 4;
                case 3: return note.start = 5;
              }
            })
          );
        });

        it("wraps start times around from clip.start to clip.end in the negative direction", () => {
          slideTransformer.setRange('start', 8);
          assert.deepStrictEqual(
            slideTransformer.shift('start', -1.0),
            mapNotes(notes, (note, index) => {
              switch (index) {
                case 0: return note.start = 18;
                case 1: return note.start = 19;
                case 2: return note.start = 4;
                case 3: return note.start = 5;
              }
            })
          );
        });
      });

      describe("edgeBehavior = 'reflect'", () => {
        beforeEach(() => slideTransformer.edgeBehavior = 'reflect');

        it("reflects start times after clip.end to the negative direction", () => {
          slideTransformer.setRange('start', 8);
          assert.deepStrictEqual(
            slideTransformer.shift('start', 1.0),
            mapNotes(notes, (note, index) => {
              switch (index) {
                case 0: return note.start = 18;
                case 1: return note.start = 19;
                case 2: return note.start = 20 - Note.MIN_DURATION; // MIN_DURATION is subtracted so the note is audible
                case 3: return note.start = 19;
              }
            })
          );
        });

        it("reflects start times before clip.start to the positive direction", () => {
          slideTransformer.setRange('start', 8);
          assert.deepStrictEqual(
            slideTransformer.shift('start', -1.0),
            mapNotes(notes, (note, index) => {
              switch (index) {
                case 0: return note.start = 6;
                case 1: return note.start = 5;
                case 2: return note.start = 4;
                case 3: return note.start = 5;
              }
            })
          );
        });
      });

      describe("edgeBehavior = 'remove'", () => {
        beforeEach(() => slideTransformer.edgeBehavior = 'remove');

        it("allows start times to go after clip.end", () => {
          slideTransformer.setRange('start', 10);
          assert.deepStrictEqual(
            slideTransformer.shift('start', 1.0),
            mapNotes(notes, note => note.start += 10)
          );
        });

        it("allows start times to go before clip.start", () => {
          slideTransformer.setRange('start', 20);
          assert.deepStrictEqual(
            slideTransformer.shift('start', -1.0),
            mapNotes(notes, note => note.start -= 20)
          );
        });
      });
    });

    describe("shift('duration', amount)", () => {
      it('shifts durations by the given range and positive amount ratio', () => {
        slideTransformer.setRange('duration', 4);
        assert.deepStrictEqual(
          slideTransformer.shift('duration', 0.5),
          mapNotes(notes, note => note.duration += 2)
        );
      });

      it('shifts durations by the given range and negative amount ratio', () => {
        slideTransformer.setRange('duration', 20);
        assert.deepStrictEqual(
          slideTransformer.shift('duration', -0.25),
          mapNotes(notes, note => note.duration -= 5)
        );
      });

      describe("edgeBehavior = 'clip'", () => {
        beforeEach(() => slideTransformer.edgeBehavior = 'clip');

        it("clamps durations to a max of the clip length", () => {
          slideTransformer.setRange('duration', 5);
          assert.deepStrictEqual(
            slideTransformer.shift('duration', 1.0),
            mapNotes(notes, (note, index) => note.duration = index === 0 ? 15 : 16)
          );
        });

        it("clamps durations to a min of Note.MIN_DURATION", () => {
          slideTransformer.setRange('duration', 12);
          assert.deepStrictEqual(
            slideTransformer.shift('duration', -1.0),
            mapNotes(notes, (note, index) => note.duration = index < 3 ? Note.MIN_DURATION : 1)
          );
        });
      });

      describe("edgeBehavior = 'rotate'", () => {
        beforeEach(() => slideTransformer.edgeBehavior = 'rotate');

        it("wraps durations around from MIN_DURATION+clip.length to MIN_DURATION in the positive direction", () => {
          const offset = Note.MIN_DURATION + 0.001;
          slideTransformer.setRange('duration', offset + 5);
          const actual = slideTransformer.shift('duration', 1.0);
          const expected = mapNotes(notes, (note, index) => {
            switch (index) {
              case 0: return note.duration = 15 + offset;
              case 1: return note.duration = offset;
              case 2: return note.duration = 1 + offset;
              case 3: return note.duration = 2 + offset;
            }
          });
          actual.forEach((note, index) =>
            // Use note.equals() because it does a "fuzzy" comparison on floating point numbers:
            assert(
              note.equals(expected[index]),
              `Expected ${note} to equal ${expected[index]}`
            )
          );
        });

        it("wraps durations around from MIN_DURATION to MIN_DURATION+clip.length in the negative direction", () => {
          const offset = Note.MIN_DURATION + 0.001;
          slideTransformer.setRange('duration', 12 - offset);
          const actual = slideTransformer.shift('duration', -1.0);
          const expected = mapNotes(notes, (note, index) => {
            switch (index) {
              case 0: return note.duration = 14 + offset;
              case 1: return note.duration = 15 + offset;
              case 2: return note.duration = offset;
              case 3: return note.duration = 1 + offset;
            }
          });
          actual.forEach((note, index) =>
            // Use note.equals() because it does a "fuzzy" comparison on floating point numbers:
            assert(
              note.equals(expected[index]),
              `Expected ${note} to equal ${expected[index]}`
            )
          );
        });
      });

      describe("edgeBehavior = 'reflect'", () => {
        beforeEach(() => slideTransformer.edgeBehavior = 'reflect');

        it("reflects durations above clip.length+Note.MIN_DURATION to the negative direction", () => {
          const offset = Note.MIN_DURATION + 0.001;
          const reflectedOffset = Note.MIN_DURATION - 0.001;
          slideTransformer.setRange('duration', offset + 5);
          const actual = slideTransformer.shift('duration', 1.0);
          const expected = mapNotes(notes, (note, index) => {
            switch (index) {
              case 0: return note.duration = 15 + offset;
              case 1: return note.duration = 16 + reflectedOffset;
              case 2: return note.duration = 15 + reflectedOffset;
              case 3: return note.duration = 14 + reflectedOffset;
            }
          });
          actual.forEach((note, index) =>
            // Use note.equals() because it does a "fuzzy" comparison on floating point numbers:
            assert(
              note.equals(expected[index]),
              `Expected ${note} to equal ${expected[index]}`
            )
          );
        });

        it("reflects durations below Note.MIN_DURATION to the positive direction", () => {
          const offset = Note.MIN_DURATION + 0.001;
          const reflectedOffset = Note.MIN_DURATION - 0.001;
          slideTransformer.setRange('duration', 12 - offset);
          const actual = slideTransformer.shift('duration', -1.0);
          const expected = mapNotes(notes, (note, index) => {
            switch (index) {
              case 0: return note.duration = 2 + reflectedOffset;
              case 1: return note.duration = 1 + reflectedOffset;
              case 2: return note.duration = offset;
              case 3: return note.duration = 1 + offset;
            }
          });
          actual.forEach((note, index) =>
            // Use note.equals() because it does a "fuzzy" comparison on floating point numbers:
            assert(
              note.equals(expected[index]),
              `Expected ${note} to equal ${expected[index]}`
            )
          );
        });
      });

      describe("edgeBehavior = 'remove'", () => {
        beforeEach(() => slideTransformer.edgeBehavior = 'remove');

        it("imposes no max on durations", () => {
          slideTransformer.setRange('duration', 20);
          assert.deepStrictEqual(
            slideTransformer.shift('duration', 1.0),
            mapNotes(notes, note => note.duration += 20)
          );
        });

        it("removes notes shorter than ", () => {
          slideTransformer.setRange('duration', 10.999); // 11 - 10.999 will be < MIN_DURATION
          const actual = slideTransformer.shift('duration', -1.0);
          assert.strictEqual(actual.length, 2);
          assert(actual[0].equals(new Note({ pitch: 12, velocity: 12, start: 12, duration: 1.001 })));
          assert(actual[1].equals(new Note({ pitch: 13, velocity: 13, start: 13, duration: 2.001 })));
        });
      });
    });
  });

  describe('spread()', () => {
    // TODO:

    // Maybe we don't need to retest every edge behavior since it should behave the same way

    // it('is idempotent', () => { });
  });

  describe('randomize2D()', () => {
    // TODO:

    // Maybe we don't need to retest every edge behavior since it should behave the same way

    // it('is idempotent', () => { });
  });
});
