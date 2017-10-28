interface NoteOptions {
  pitch?: number
  start?: number
  velocity?: number
  duration?: number
  muted?: boolean
}

export interface NoteJSON {
  pitch: number
  start: number
  velocity: number
  duration: number
  muted: boolean
}

const DEFAULT_NOTE_OPTIONS = { 
  pitch: 60, 
  start: 0, 
  velocity: 100, 
  duration: 1, 
  muted: false,
}

type NumericProperty = 'pitch' | 'start' | 'velocity' | 'duration'

export default class Note {
  
  static get MIN_DURATION() { return 1 / 256 }

  pitch: number
  start: number
  velocity: number
  duration: number
  muted: boolean
  
  constructor(options: NoteOptions = {}) {
    Object.assign(this, DEFAULT_NOTE_OPTIONS, options)
  }

  get valid() {
    return this.pitch >= 0 && this.pitch <= 127
      && this.velocity >= 0 && this.velocity <= 127
      && this.duration >= Note.MIN_DURATION
  }

  // get and set numeric properties dynamically:
  get(property: NumericProperty): number {
    return this[property]
  }

  set(property: NumericProperty, value: number) {  
   this[property] = value
  }

  toJSON(): NoteJSON {
    return { pitch: this.pitch, start: this.start, velocity: this.velocity, duration: this.duration, muted: this.muted }
  }

  toString() {
    return `Note{pitch:${this.pitch},velocity:${this.velocity},duration:${this.duration},start:${this.start}${this.muted ? ',muted:true' : ''}}`;
  }

  clone() {
    return new Note(this.toJSON())
  }
}
