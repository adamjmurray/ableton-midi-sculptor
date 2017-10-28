import Note from './note'
// import { log } from './logger'

// TODO: move this into the Note class
type SerializedNote = [number, string, string, number, boolean]
type NoteSerializer = (notes: Note[]) => SerializedNote[]
const DEFAULT_NOTE_SERIALIZER: NoteSerializer = (notes: Note[]) => {
  // This serializers avoids clipping to min/max values.
  // When property values bcome invalid, the note is removed.
  // The one exception is when velocity exceeds 127, it is clipped to 127 (it's undesirable to remove a note that gets "too loud")
  const serializedNotes: SerializedNote[] = []
  for (const note of notes) {
    let { pitch, start, duration, velocity, muted } = note
    if (pitch >= 0 && pitch <= 127 && duration >= Note.MIN_DURATION && velocity >= 0) {
      serializedNotes.push([
        Math.round(pitch),
        start.toFixed(4),
        duration.toFixed(4),
        velocity > 127 ? 127 : Math.round(velocity),
        muted
      ]);
    }
  }
  return serializedNotes
}

export default class Clip {
  static readonly SELECTED_CLIP_PATH = 'live_set view detail_clip'
  private api: LiveAPI
  private _exists?: boolean
  private _isMidi?: boolean
  private _length?: number
  private _start?: number
  private _end?: number

  constructor(path: string) {
    this.api = new LiveAPI(path)
  }

  desync() {
    this._exists = undefined
    this._isMidi = undefined
    this._length = undefined
    this._start = undefined
    this._end = undefined
  }

  get exists(): boolean {
    if (this._exists === undefined) {
      this._exists = Boolean(this.api.id !== '0')
    }
    return this._exists
  }

  get isMidi(): boolean {
    if (!this.exists) return false
    if (this._isMidi === undefined) {
      const value =this.api.get('is_midi_clip')
      this._isMidi = Boolean(value instanceof Array ? value[0] : value) // api quirk
    }
    return this._isMidi
  }

  get length(): number {
    if (this._length === undefined) {
      this._length = Number(this.api.get('length'))
    }
    return this._length
  }

  get start(): number {
    if (this._start === undefined) {
      this._start = Number(this.api.get('loop_start'))
    }
    return this._start
  }

  get end(): number {
    if (this._end === undefined) {
      this._end = Number(this.api.get('loop_end'))
    }
    return this._end
  }

  get selectedNotes(): Note[] {
    const data = this.api.call('get_selected_notes') /* =>
      "notes" count
        "note" pitch start duration velocity muted // 0 or more 6-tuples
        "note" pitch start duration velocity muted
        ...
      "done" */
    if (!(data instanceof Array)) return []
    const notes = []
    for (let i = 2; i < data.length-1; i += 6) { // `i = 2` skips "notes count" at beginning, `< data.length-1` skips "done" at end
      notes.push(new Note({
        pitch: Number(data[i+1]), 
        start: Number(data[i+2]), 
        duration: Number(data[i+3]), 
        velocity: Number(data[i+4]), 
        muted: Boolean(data[i+5]),
      }))
    }
    return notes
  }

  selectAllNotes(): Note[] {
    this.api.call('select_all_notes')
    return this.selectedNotes
  }

  replaceSelectedNotes(notes: Note[], noteSerializer: NoteSerializer = DEFAULT_NOTE_SERIALIZER) {  // provide a custom note serializer to implement wrap-around behaviors
    const serializedNotes = noteSerializer(notes)
    this.api.call('replace_selected_notes')
    this.api.call('notes', serializedNotes.length)
    serializedNotes.forEach(serializedNote => this.api.call('note', ...serializedNote))
    this.api.call('done')
  }
}
