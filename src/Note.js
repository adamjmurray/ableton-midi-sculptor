import { clamp, fuzzyEquals } from "./utils";

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
    // If we don't call round() or toFixed() on these numbers, they can sometimes serialize as values the Live API won't accept.
    return [
      clamp(Math.round(this.pitch), 0, 127),
      this.start.toFixed(6),
      (this.duration < Note.MIN_DURATION ? Note.MIN_DURATION : this.duration).toFixed(6),
      clamp(Math.round(this.velocity), 0, 127),
      this.muted ? 1 : 0,
    ];
  }

  toString() {
    return `Note{pitch:${this.pitch},velocity:${this.velocity},duration:${this.duration},start:${this.start}${this.muted ? ",muted:true" : ""}}`;
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
