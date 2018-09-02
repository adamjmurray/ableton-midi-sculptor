import './polyfills'
import Controller from './Controller'
console.log("___________________________________________________")
console.log("Reload:", new Date())

var controller = new Controller()

export function desync() {
  controller.desync()
}

export function clipchange() {
  controller.onClipChange()
}

/**
 Set maximum change in value for the given property.
 The range value for each property applies to its average, spread, and random operations.
 - property is velocity, start, duration
 - amount is from 0 to 127 for velocity, or a positive number in beats for start/duration
 */
export function slide_range(property, amount) {
  controller.setSlideRange(property.toLowerCase(), amount)
}

export function slide_edges(behavior) {
  controller.slideEdgeBehavior = behavior
}

export function slide_anchor(anchor) {
  controller.spreadAnchor = anchor
}

export function slide_shift(property, amount) {
  controller.shift(property.toLowerCase(), amount)
}

/**
 Spread the notes' property values towards or away from the midpoint value.
 - property is velocity, start, duration
 - amount should be from -1.0 to 1.0
 */
export function slide_spread(property, amount) {
  controller.spread(property.toLowerCase(), amount)
}

/**
 2-D randomization for the notes' property value.
 - property is velocity, start, duration
 - amountX and amountY should be from -1.0 to 1.0
 The randomization behavior is consistent until the next bang/reset, in other words:
 random('velocity', 0.5, -0.25) will always have the same effect until the next reset (i.e. mouseup)
 */
export function slide_random(property, amountX, amountY) {
  controller.randomSlide(property.toLowerCase(), amountX, amountY)
}

export function swap_target(property, enabled) {
  controller.swapTarget(property.toLowerCase(), enabled)
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

export function swap_random(amountX, amountY) {
  controller.randomSwap(amountX, amountY)
}

export function set_property(property) {
  controller.setProperty(property.toLowerCase())
}

export function set_value(value) {
  if (typeof value === 'string') value = value.toLowerCase()
  controller.setValue(value)
}

export function set_all() {
  controller.setAll()
}

export function set_random(amountX, amountY) {
  controller.randomSetValues(amountX, amountY)
}

export function split_type(type, amount1, amount2) {
  controller.setSplitType(type.toLowerCase(), amount1, amount2)
}

export function split_gate(amount) {
  controller.splitGate = amount
}

export function split_envelope(type) {
  controller.splitEnvelope = type.toLowerCase()
}

export function split() {
  controller.split()
}

export function split_tilt(amount) {
  controller.splitTilt(amount)
}
