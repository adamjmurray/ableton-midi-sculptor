import Transformer from "./Transformer";

function groupIntoChords(notes) {}

export default class StrumTransformer extends Transformer {
  constructor() {
    super();
    this.range = 1;
    this.anchor = "start";
  }

  set notes(notes) {
    super.setNotes(notes);
  }

  strum(amount) {
    // TODO:
    // - group all overlapping notes into chords
    // - sort the pitches
    // - (taking the anchor into account...)
    // - shift the notes based on the amount and range
    // TODO: second phase
    // - add tension (exponential) parameter
    // - consider letting this "bend" the already strummed notes
  }

  // TODO?
  // randomize2D(amountX, amountY) {
  // }
}
