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
        deleted: false, // boolean. Tracks if a note has been "soft deleted". See Clip.replaceSelectedNotes()
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
      deleted: this.deleted,
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
    });
  }

  toLiveAPI() {
    return {
      note_id: this.id,
      pitch: clamp(Math.round(this.pitch), 0, 127),
      start_time: this.start,  // we used to have to call toFixed(6)
      duration: this.duration < Note.MIN_DURATION ? Note.MIN_DURATION : this.duration, // we used to have to call toFixed(6)
      velocity: clamp(this.velocity, 1, 127),
      velocity_deviation: clamp(this.velrange, -127, 127),
      release_velocity: clamp(this.release, 0, 127),
      probability: clamp(this.probability, 0, 1),
      mute: (this.muted || this.deleted) ? 1 : 0,
    };
  }

  toString() {
    return `Note(${JSON.stringify(this.toJSON())})`;
  }

  equals(note) {
    return (
      this.id === note.id &&
      this.pitch === note.pitch &&
      fuzzyEquals(this.start, note.start) &&
      fuzzyEquals(this.duration, note.duration) &&
      this.velocity === note.velocity &&
      this.velrange === note.velrange &&
      this.release === note.release &&
      fuzzyEquals(this.probability, note.probability) &&
      this.muted === note.muted &&
      this.deleted === note.deleted
    );
  }

  clone() {
    return new Note(this.toJSON());
  }
}
