const DEFAULT_NOTE_OPTIONS = {
  pitch: 60,
  start: 0,
  velocity: 100,
  duration: 1,
  muted: false
};

const fuzzyEquals = (n1, n2, delta = 0.001) => Math.abs(n1 - n2) < delta;

export default class Note {
  static get MIN_DURATION() {
    return 1 / 256;
  }

  constructor(options = {}) {
    Object.assign(this, DEFAULT_NOTE_OPTIONS, options);
    this.pitch = 0
    this.start = 0
    this.velocity = 0
    this.duration = 0
    this.muted = false
  }

  get valid() {
    return this.pitch >= 0 && this.pitch <= 127 && this.velocity >= 0 && this.velocity <= 127 && this.duration >= Note.MIN_DURATION;
  } // get and set numeric properties dynamically:


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
      muted: this.muted
    };
  }

  serialize() {
    return [Math.round(this.pitch), this.start.toFixed(4), this.duration.toFixed(4), this.velocity > 127 ? 127 : Math.round(this.velocity), Number(this.muted)];
  }

  toString() {
    return `Note{pitch:${this.pitch},velocity:${this.velocity},duration:${this.duration},start:${this.start}${this.muted ? ',muted:true' : ''}}`;
  }

  equals(note, ignoreDuration = false) {
    return this.pitch === note.pitch && this.velocity === note.velocity && (ignoreDuration || fuzzyEquals(this.duration, note.duration)) && fuzzyEquals(this.start, note.start) && this.muted === note.muted;
  }

  clone() {
    return new Note(this.toJSON());
  }

}