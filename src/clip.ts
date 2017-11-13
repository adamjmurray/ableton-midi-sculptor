import Note from './note'
// import { log } from './logger'

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
    notes.sort((n1,n2) => (n1.start - n2.start) || (n1.pitch - n2.pitch))
    return notes
  }

  selectAllNotes(): Note[] {
    this.api.call('select_all_notes')
    return this.selectedNotes
  }

  replaceSelectedNotes(notes: Note[]) {
    this.api.call('replace_selected_notes')
    this.api.call('notes', notes.length)
    notes.forEach(note => this.api.call('note', ...note.serialize()))
    this.api.call('done')
  }
}
