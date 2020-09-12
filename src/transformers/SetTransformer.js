import Transformer from "./Transformer";

export default class SetTransformer extends Transformer {
  constructor() {
    super();
    this.property = "note";
    this.value = "muted";
  }

  set notes(notes) {
    super.setNotes(notes);
  }

  setValue(note) {
    // Warning: This modifies the Note in place for efficiency
    const { property, value } = this;

    if (property === "note") {
      if (value === "deleted") {
        return null;
      } else if (value === "muted") {
        note.muted = true;
      } else if (value === "unmuted") {
        note.muted = false;
      }
    } else if (typeof value === "number") {
      note.set(property, value);
    }

    return note;
  }

  setAll() {
    return this.newNotes.map((note) => this.setValue(note)).filter((note) => note);
  }

  randomize2D(amountX, amountY) {
    return this.newNotes
      .map((note, index) => {
        if (this.isInRandomBounds(amountX, amountY, index)) {
          return this.setValue(note);
        } else {
          return this.oldNotes[index];
        }
      })
      .filter((note) => note != null);
  }
}
