import assert from 'assert';
import { clamp, fuzzyEquals, mod, reflectedMod } from '../src';

describe('utils', () => {
  describe('clamp', () => {
    it('does not change values between the given minimum and maximum (inclusive)', () => {
      assert.strictEqual(clamp(0, 0, 3), 0);
      assert.strictEqual(clamp(1, 0, 3), 1);
      assert.strictEqual(clamp(2, 0, 3), 2);
      assert.strictEqual(clamp(3, 0, 3), 3);
      assert.strictEqual(clamp(1.5, 1.1, 1.6), 1.5);
      assert.strictEqual(clamp(-3, -3, 3), -3);
      assert.strictEqual(clamp(1, 1, 1), 1);
    });

    it('sets the value to the minimum when it is less than the minimum', () => {
      assert.strictEqual(clamp(0, 1, 3), 1);
      assert.strictEqual(clamp(0, 2, 3), 2);
      assert.strictEqual(clamp(-1, 2, 3), 2);
      assert.strictEqual(clamp(-2, -1, 3), -1);
      assert.strictEqual(clamp(1.1, 1.2, 3), 1.2);
    });

    it('sets the value to the maximum when it is greater than the maximum', () => {
      assert.strictEqual(clamp(5, 1, 3), 3);
      assert.strictEqual(clamp(5, 1, 4), 4);
      assert.strictEqual(clamp(0, -2, -1), -1);
      assert.strictEqual(clamp(-1, -3, -2), -2);
      assert.strictEqual(clamp(1.3, 1.1, 1.2), 1.2);
    });
  });

  describe('fuzzyEquals', () => {
    it('is true when the numbers are equal', () => {
      assert(fuzzyEquals(0, 0));
      assert(fuzzyEquals(1.5, 1.5));
      assert(fuzzyEquals(-2 / 3, -2 / 3));
      assert(fuzzyEquals(Number.MAX_VALUE, Number.MAX_VALUE));
      assert(fuzzyEquals(Number.MAX_VALUE + 1, Number.MAX_VALUE + 1));
    });

    it('is true when both numbers are NaN', () => {
      assert(fuzzyEquals(NaN, NaN));
    });

    it('is true when both numbers are Infinity', () => {
      assert(fuzzyEquals(Infinity, Infinity));
      assert(fuzzyEquals(-Infinity, -Infinity));
    });

    it('is true when the numbers are different but close in value', () => {
      assert(fuzzyEquals(1, 1.00000001));
      assert(fuzzyEquals(100000001 / 100000000, 1.00000001));
      assert(fuzzyEquals(2 / 3, 2 / 3 / Number.MAX_VALUE * Number.MAX_VALUE));
    });

    it('is false whent he numbers are different and not close in value', () => {
      assert(!fuzzyEquals(0, 1));
      assert(!fuzzyEquals(0, 0.5));
      assert(!fuzzyEquals(0, 0.000001));
      assert(!fuzzyEquals(-1, 1));
      assert(!fuzzyEquals(0, NaN));
      assert(!fuzzyEquals(Number.MAX_VALUE, Infinity));
      assert(!fuzzyEquals(Infinity, -Infinity));
    });

    it('allows the fuzziness to be controlled', () => {
      assert(fuzzyEquals(0, 0.0999999999, 0.1));
      assert(fuzzyEquals(0.0999999999, 0, 0.1));
      assert(!fuzzyEquals(0, 0.1, 0.1));

      assert(fuzzyEquals(1, 1, 0));
      assert(!fuzzyEquals(1, 0.9999999999999, 0));
    });
  });

  describe('mod()', () => {
    it('behaves like the % operator for positive numbers and handles negative numbers with wrap-around to always return a postive value', () => {
      const tests = {
        // divisor: {dividend: expected}
        0: {
          '-1': NaN,
          ' 0': NaN,
          '+1': NaN,
        },
        1: {
          // mod() can return -0, which is === 0 so it does not matter in practice
          // but 0 and -0 are not strictEqual so we need to expect -0 in these tests
          '-2': 0,
          '-1': 0,
          ' 0': 0,
          '+1': 0,
          '+2': 0,
        },
        2: {
          '-3': 1,
          '-2': 0,
          '-1': 1,
          ' 0': 0,
          '+1': 1,
          '+2': 0,
          '+3': 1,
        },
        3: {
          '-4': 2,
          '-3': 0,
          '-2': 1,
          '-1': 2,
          ' 0': 0,
          '+1': 1,
          '+2': 2,
          '+3': 0,
          '+4': 1,
        },
        4: {
          '-5': 3,
          '-4': 0,
          '-3': 1,
          '-2': 2,
          '-1': 3,
          ' 0': 0,
          '+1': 1,
          '+2': 2,
          '+3': 3,
          '+4': 0,
          '+5': 1,
        },
        5: {
          '-6': 4,
          '-5': 0,
          '-4': 1,
          '-3': 2,
          '-2': 3,
          '-1': 4,
          ' 0': 0,
          '+1': 1,
          '+2': 2,
          '+3': 3,
          '+4': 4,
          '+5': 0,
          '+6': 1,
        }
      }
      Object.entries(tests).forEach(([divisorString, expectations]) => {
        const divisor = Number(divisorString);
        Object.entries(expectations).forEach(([dividend, expected]) => {
          assert.strictEqual(
            mod(dividend, divisor),
            expected,
            `mod(${dividend}, ${divisor}) === ${expected}`
          );
        });
      });
    });

    it('works with fractional numbers', () => {
      const tests = {
        // divisor: {dividend: expected}
        0: {
          '-0.2': NaN,
          '+0.2': NaN,
        },
        1: {
          '-1.2': 0.8,
          '-0.2': 0.8,
          '+0.2': 0.2,
          '+1.2': 0.2,
        },
        2: {
          '-4.2': 1.8,
          '-3.2': 0.8,
          '-2.2': 1.8,
          '-1.2': 0.8,
          '-0.2': 1.8,
          '+0.2': 0.2,
          '+1.2': 1.2,
          '+2.2': 0.2,
          '+3.2': 1.2,
          '+4.2': 0.2,
        },
        3: {
          '-7.2': 1.8,
          '-6.2': 2.8,
          '-5.2': 0.8,
          '-4.2': 1.8,
          '-3.2': 2.8,
          '-2.2': 0.8,
          '-1.2': 1.8,
          '-0.2': 2.8,
          '+0.2': 0.2,
          '+1.2': 1.2,
          '+2.2': 2.2,
          '+3.2': 0.2,
          '+4.2': 1.2,
          '+5.2': 2.2,
          '+6.2': 0.2,
          '+7.2': 1.2,
        },
        4: {
          '-5.2': 2.8,
          '-4.2': 3.8,
          '-3.2': 0.8,
          '-2.2': 1.8,
          '-1.2': 2.8,
          '-0.2': 3.8,
          '+0.2': 0.2,
          '+1.2': 1.2,
          '+2.2': 2.2,
          '+3.2': 3.2,
          '+4.2': 0.2,
          '+5.2': 1.2,
        },
        5: {
          '-6.2': 3.8,
          '-5.2': 4.8,
          '-4.2': 0.8,
          '-3.2': 1.8,
          '-2.2': 2.8,
          '-1.2': 3.8,
          '-0.2': 4.8,
          '+0.2': 0.2,
          '+1.2': 1.2,
          '+2.2': 2.2,
          '+3.2': 3.2,
          '+4.2': 4.2,
          '+5.2': 0.2,
          '+6.2': 1.2,
        }
      }
      Object.entries(tests).forEach(([divisorString, expectations]) => {
        const divisor = Number(divisorString);
        Object.entries(expectations).forEach(([dividend, expected]) => {
          const actual = mod(dividend, divisor);
          assert(
            fuzzyEquals(actual, expected),
            `expected mod(${dividend}, ${divisor}) === ${expected} but got ${actual}`
          );
        });
      });
    });
  });

  describe('reflectedMod()', () => {
    it('"bounces" off the boundary', () => {
      const tests = {
        // divisor: {dividend: expected}
        0: {
          '-1': NaN,
          ' 0': NaN,
          '+1': NaN,
        },
        1: {
          '-3': 1,
          '-2': 0,
          '-1': 1,
          ' 0': 0,
          '+1': 1,
          '+2': 0,
          '+3': 1,
        },
        2: {
          '-5': 1,
          '-4': 0,
          '-3': 1,
          '-2': 2,
          '-1': 1,
          ' 0': 0,
          '+1': 1,
          '+2': 2,
          '+3': 1,
          '+4': 0,
          '+5': 1,
        },
        3: {
          '-7': 1,
          '-6': 0,
          '-5': 1,
          '-4': 2,
          '-3': 3,
          '-2': 2,
          '-1': 1,
          ' 0': 0,
          '+1': 1,
          '+2': 2,
          '+3': 3,
          '+4': 2,
          '+5': 1,
          '+6': 0,
          '+7': 1,
        },
        4: {
          '-9': 1,
          '-8': 0,
          '-7': 1,
          '-6': 2,
          '-5': 3,
          '-4': 4,
          '-3': 3,
          '-2': 2,
          '-1': 1,
          ' 0': 0,
          '+1': 1,
          '+2': 2,
          '+3': 3,
          '+4': 4,
          '+5': 3,
          '+6': 2,
          '+7': 1,
          '+8': 0,
          '+9': 1,
        },
        5: {
          '-11': 1,
          '-10': 0,
          '-9': 1,
          '-8': 2,
          '-7': 3,
          '-6': 4,
          '-5': 5,
          '-4': 4,
          '-3': 3,
          '-2': 2,
          '-1': 1,
          ' 0': 0,
          '+1': 1,
          '+2': 2,
          '+3': 3,
          '+4': 4,
          '+5': 5,
          '+6': 4,
          '+7': 3,
          '+8': 2,
          '+9': 1,
          '+10': 0,
          '+11': 1,
        }
      }
      Object.entries(tests).forEach(([divisorString, expectations]) => {
        const divisor = Number(divisorString);
        Object.entries(expectations).forEach(([dividend, expected]) => {
          assert.strictEqual(
            reflectedMod(dividend, divisor),
            expected,
            `reflectedMod(${dividend}, ${divisor}) === ${expected}`
          );
        });
      });
    });

    it('works with fractional numbers', () => {
      const tests = {
        // divisor: {dividend: expected}
        0: {
          '-0.2': NaN,
          '+0.2': NaN,
        },
        1: {
          '-2.2': 0.2,
          '-1.2': 0.8,
          '-0.2': 0.2,
          '+0.2': 0.2,
          '+1.2': 0.8,
          '+2.2': 0.2,
        },
        2: {
          '-4.2': 0.2,
          '-3.2': 0.8,
          '-2.2': 1.8,
          '+2.2': 1.8,
          '+3.2': 0.8,
          '+4.2': 0.2,
        },
        3: {
          '-6.2': 0.2,
          '-5.2': 0.8,
          '-4.2': 1.8,
          '+4.2': 1.8,
          '+5.2': 0.8,
          '+6.2': 0.2,
        },
        4: {
          '-8.2': 0.2,
          '-7.2': 0.8,
          '-6.2': 1.8,
          '+6.2': 1.8,
          '+7.2': 0.8,
          '+8.2': 0.2,
        },
        5: {
          '-10.2': 0.2,
          '-9.2': 0.8,
          '-8.2': 1.8,
          '+8.2': 1.8,
          '+9.2': 0.8,
          '+10.2': 0.2,
        }
      }
      Object.entries(tests).forEach(([divisorString, expectations]) => {
        const divisor = Number(divisorString);
        Object.entries(expectations).forEach(([dividend, expected]) => {
          const actual = reflectedMod(dividend, divisor);
          assert(
            fuzzyEquals(actual, expected),
            `expected reflectedMod(${dividend}, ${divisor}) === ${expected} but got ${actual}`
          );
        });
      });
    });
  });
});
