import { clamp, fuzzyEquals } from "./utils";

export default class Note {
  static get MIN_DURATION() {
    return 1 / 256;
  }

  constructor(options = {}) {
    Object.assign(
      this,
      {
        id: null, // positive int
        pitch: 60, // 0 - 127
        start: 0, // time in beats (float)
        duration: 1, // time in beats (float)
        velocity: 100, // 0 - 127
        velrange: 0, // -127 - 127
        release: 100, // 0 - 127
        probability: 1, // 0.0 - 1.0
        muted: false, // boolean
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
      id: this.id,
      pitch: this.pitch,
      start: this.start,
      duration: this.duration,
      velocity: this.velocity,
      velrange: this.velrange,
      release: this.release,
      probability: this.probability,
      muted: this.muted,
    };
  }

  static fromLiveAPI(data) {
    return new Note({
      id: data.note_id,
      pitch: data.pitch,
      start: data.start_time,
      duration: data.duration,
      velocity: data.velocity,
      velrange: data.velocity_deviation,
      release: data.release_velocity,
      probability: data.probability,
      muted: !!data.mute,
    })
  }

  toLiveAPI() {
    return {
      note_id: this.id, // Note only use this for apply_note_modifications, not adding new notes!
      pitch: this.pitch, // Do we need this anymore? clamp(Math.round(this.pitch), 0, 127). Same for velocity, etc
      start_time: this.start,  // we used to have to call toFixed(4)
      duration: this.duration < Note.MIN_DURATION ? Note.MIN_DURATION : this.duration, // we used to have to call toFixed(4)
      velocity: this.velocity,
      velocity_deviation: this.velrange,
      release_velocity: this.release,
      probability: this.probability,
      mute: this.muted ? 1 : 0,
    };
  }

  toString() {
    return `Note(${JSON.stringify(this.toJSON())})`;
  }

  // TODO: update for the new props
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
