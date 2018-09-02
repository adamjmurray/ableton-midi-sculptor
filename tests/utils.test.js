import assert from 'assert';
import { mod, reflectedMod } from '../src';

describe('utils', () => {

  describe('mod()', () => {
    it('should behave like the % operator for positive numbers', () => {
      assert.equal(mod(0, 3), 0);
      assert.equal(mod(2, 3), 2);
      assert.equal(mod(5, 4), 1);
      assert.equal(mod(20, 6), 2);
    });

    it('handles negative numbers with wrap-around to always return a postive value', () => {
      assert.equal(mod(-1, 4), 3);
      assert.equal(mod(-3, 4), 1);
    });
  });

  describe('reflectedMod()', () => {
    it('"bounces" off the boundary', () => {
      assert.equal(reflectedMod(0, 4), 0);
      assert.equal(reflectedMod(1, 4), 1);
      assert.equal(reflectedMod(3, 4), 3);
      assert.equal(reflectedMod(4, 4), 4);
      assert.equal(reflectedMod(5, 4), 3);
      assert.equal(reflectedMod(6, 4), 2);
      assert.equal(reflectedMod(8, 4), 0);
      assert.equal(reflectedMod(9, 4), 1);
      assert.equal(reflectedMod(12, 4), 4);
      assert.equal(reflectedMod(13, 4), 3);
    });

    it('works with negative numbers', () => {
      assert.equal(reflectedMod(-1, 4), 1);
      assert.equal(reflectedMod(-3, 4), 3);
      assert.equal(reflectedMod(-4, 4), 4);
      assert.equal(reflectedMod(-5, 4), 3);
      assert.equal(reflectedMod(-6, 4), 2);
      assert.equal(reflectedMod(-8, 4), 0);
      assert.equal(reflectedMod(-9, 4), 1);
      assert.equal(reflectedMod(-12, 4), 4);
      assert.equal(reflectedMod(-13, 4), 3);
    });
  });
});
