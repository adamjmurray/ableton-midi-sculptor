import Note from './note'
import { log } from './logger'

type NoteSerializer = (Note) => [Number, Number, Number, Number, Boolean]
const DEFAULT_NOTE_SERIALIZER: NoteSerializer = note => [note.pitch, note.start, note.duration, note.velocity, note.muted]

export default class Clip {
  private api: LiveAPI

  constructor(path = 'live_set view detail_clip') { // default is currently selected clip
    this.api = new LiveAPI(path)
  }

  get exists(): Boolean {
    return Boolean(this.api.id !== '0')
  }

  get isMidi(): Boolean {
    if (!this.exists) return false
    const isMidi = this.api.get('is_midi_clip')
    return Boolean(isMidi instanceof Array ? isMidi[0] : isMidi) // api quirk
  }

  get length(): Number {
    return Number(this.api.get('length'))
  }

  get selectedNotes(): Note[] {
    const data = this.api.call('get_selected_notes') /* =>
      "notes" count
        "note" pitch start duration velocity muted // 0 or more 6-tuples
        "note" pitch start duration velocity muted
        ...
      "done" */
    if (!(data instanceof Array)) return
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

  selectAllNotes() {
    this.api.call('select_all_notes')
  }

  replaceSelectedNotes(notes: Note[], noteSerializer: NoteSerializer = DEFAULT_NOTE_SERIALIZER) {  // provide a custom note serializer to implement wrap-around behaviors
    this.api.call('replace_selected_notes')
    this.api.call('notes', notes.length)
    notes.forEach(note => this.api.call('note', noteSerializer(note)))
    this.api.call('done')
  }
}
