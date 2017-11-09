const assert = require('assert')
import { mod } from '../utils'

describe('utils', () => {

  describe('mod()', () => {
    it('should behave like the % operator for positive numbers', () => {
      assert.equal(mod(0,3), 0 % 3)
      assert.equal(mod(2,3), 2 % 3)
      assert.equal(mod(5,4), 5 % 4)
      assert.equal(mod(20,6), 20 % 6)
    })

    it('handles negative numbers with wrap-around to always return a postive value', () => {
      assert.equal(mod(-1,4), 3)
      assert.equal(mod(-3,4), 1)
    })
  })
})
