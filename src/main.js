import './polyfills'
import { log } from './logger'
import Controller, { SlidableProperty } from './controller'
import { NotePropertyValue } from './transformers/set-transformer'
log("___________________________________________________")
log("Reload:", new Date())

var controller = new Controller()

export function desync() {
  controller.desync()
}

/**
 Set maximum change in value for the given property.
 The range value for each property applies to its average, spread, and random operations.
 - property is velocity, start, duration
 - amount is from 0 to 127 for velocity, or a positive number in beats for start/duration
 */
export function slide_range(property, amount) {
  controller.setSlideRange(property, amount)
}

export function slide_edges(behavior) {
  controller.slideEdgeBehavior = behavior
}

export function slide_anchor(anchor) {
  controller.spreadAnchor = anchor
}

export function slide_shift(property, amount) {
  controller.shift(property, amount)
}

/**
 Spread the notes' property values towards or away from the midpoint value.
 - property is velocity, start, duration
 - amount should be from -1.0 to 1.0
 */
export function slide_spread(property, amount) {
  controller.spread(property, amount)
}

/**
 2-D randomization for the notes' property value.
 - property is velocity, start, duration
 - amount1 and amount2 should be from -1.0 to 1.0

 The randomization behavior is consistent until the next bang/reset, in other words:
 random('velocity', 0.5, -0.25) will always have the same effect until the next reset (i.e. mouseup)
 */
export function slide_random(property, amount1, amount2) {
  controller.randomSlide(property, amount1, amount2)
}

export function swap_property(property, enabled) {
  controller.toggleSwapProperty(property, enabled)
}

export function swap_group(type, size, extras) {
  controller.swapGroupBy(type, size, extras)
}

export function rotate(amount) {
  controller.rotate(amount)
}

export function swap_pairs() {
  controller.swapPairs()
}

export function reverse() {
  controller.reverse()
}

export function zip() {
  controller.zip()
}

export function unzip() {
  controller.unzip()
}

export function swap_random(amount1, amount2) {
  controller.randomSwap(amount1, amount2)
}

function toNumericSetValue(value) {
  if (typeof value === 'number') {
    return value
  } else {
    if (value === 'muted') {
      return NotePropertyValue.MUTED
    } else if (value === 'deleted') {
      return NotePropertyValue.DELETED
    } else {
      log('Invalid "Set" value:', value)
      return null
    }
  }
}

export function set_values(property, value) {
  var numericValue = toNumericSetValue(value)
  if (numericValue != null) {
    controller.setValues(property, numericValue)
  }
}

export function set_random(property, value, amount1, amount2) {
  var numericValue = toNumericSetValue(value)
  if (numericValue != null) {
    controller.randomSetValues(property, numericValue, amount1, amount2)
  }
}

export function chop_type(type, amount1, amount2) {
  controller.setChopType(type, amount1, amount2)
}

export function chop_gate(amount) {
  controller.chopGate = amount
}

export function chop_envelope(type) {
  controller.chopEnvelope = type
}

export function chop() {
  controller.chop()
}
