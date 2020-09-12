import "./polyfills";
import Controller from "./Controller";

const c = new Controller();

console.log("___________________________________________________");
console.log("Reload:", new Date());

//************************************************************** */
// The interface for Max:

export const desync = c.desync.bind(c);
export const clipchange = c.onClipChange.bind(c);

// Slide
export const slide_shift = c.slideShift.bind(c);
export const slide_spread = c.slideSpread.bind(c);
export const slide_random = c.slideRandomly.bind(c);

export const slide_anchor = c.setSlideAnchor.bind(c);
export const slide_edges = c.setSlideEdgeBehavior.bind(c);
export const slide_range = c.setSlideRange.bind(c);

// Swap
export const reverse = c.swapReverse.bind(c);
export const rotate = c.swapRotate.bind(c);
export const swap_pairs = c.swapPairs.bind(c);
export const swap_random = c.swapRandomly.bind(c);
export const unzip = c.swapUnzip.bind(c);
export const zip = c.swapZip.bind(c);

export const swap_target = c.setSwapTarget.bind(c);

// Set
export const set_all = c.setAll.bind(c);
export const set_random = c.setRandomly.bind(c);

export const set_property = c.setSettableProperty.bind(c);
export const set_value = c.setSettableValue.bind(c);

// Strum
export const strum = c.strum.bind(c);

export const strum_anchor = c.strumAnchor.bind(c);
export const strum_range = c.strumRange.bind(c);

// Split
export const split = c.split.bind(c);

export const split_envelope = c.setSplitEnvelope.bind(c);
export const split_gate = c.setSplitGate.bind(c);
export const split_tilt = c.setSplitTilt.bind(c);
export const split_type = c.setSplitType.bind(c);
