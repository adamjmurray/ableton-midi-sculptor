import { fuzzyEquals } from "./utils";

export default class Note {
  static get MIN_DURATION() {
    return 1 / 256;
  }

  constructor(options = {}) {
    Object.assign(
      this,
      {
        pitch: 60,
        start: 0,
        velocity: 100,
        duration: 1,
        muted: false,
      },
      options
    );
  }

  // get and set numeric properties dynamically:
  get(property) {
    return this[property];
  }
  set(property, value) {
    this[property] = value;
  }

  toJSON() {
    return {
      pitch: this.pitch,
      start: this.start,
      velocity: this.velocity,
      duration: this.duration,
      muted: this.muted,
    };
  }

  serialize() {
    return [
      Math.round(this.pitch),
      this.start.toFixed(4),
      this.duration.toFixed(4),
      this.velocity > 127 ? 127 : Math.round(this.velocity),
      Number(this.muted),
    ];
  }

  toString() {
    return `Note{pitch:${this.pitch},velocity:${this.velocity},duration:${this.duration},start:${this.start}${
      this.muted ? ",muted:true" : ""
    }}`;
  }

  equals(note, ignoreDuration = false) {
    return (
      this.pitch === note.pitch &&
      this.velocity === note.velocity &&
      fuzzyEquals(this.start, note.start) &&
      (ignoreDuration || fuzzyEquals(this.duration, note.duration)) &&
      this.muted === note.muted
    );
  }

  clone() {
    return new Note(this.toJSON());
  }
}
