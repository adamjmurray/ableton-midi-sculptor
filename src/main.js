import './polyfills'
import { log } from './logger' 
import Controller, { SlidableProperty } from './controller'
log("___________________________________________________")
log("Reload:", new Date())

var controller = new Controller()

export function bang() {
  controller.resync()
}

// /**
//  * Reset the clip. Use this when the selected clip changes in Live
//  */
export function changeclip() {
  // selectedClip = null; // hmmm, is this really necessary? isn't it supposed to follow the path?
  // clipLength = null;
  // needsReset = true;
}

export function changelength() {
  // clipLength = null;
  // needsReset = true;
}

/**
 Set maximum change in value for the given property.
 The range value for each property applies to its average, spread, and random operations.
 - property is velocity, start, duration
 - amount is from 0 to 127 for velocity, or a positive number in beats for start/duration
 */
export function setrange(property, amount) {
  controller.setSlideRange(property, amount)
}

export function average(property, amount) {
  controller.shift(property, amount)
}

/**
 Spread the notes' property values towards or away from the midpoint value.
 - property is velocity, start, duration
 - amount should be from -1.0 to 1.0
 */
export function spread(property, amount) {
  controller.spread(property, amount)
}

/**
 2-D randomization for the notes' property value.
 - property is velocity, start, duration
 - amount1 and amount2 should be from -1.0 to 1.0

 The randomization behavior is consistent until the next bang/reset, in other words:
 random('velocity', 0.5, -0.25) will always have the same effect until the next reset (i.e. mouseup)
 */
export function random(property, amount1, amount2) {
  controller.randomSlide(property, amount1, amount2)
}
