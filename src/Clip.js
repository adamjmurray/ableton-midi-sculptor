import Note from "./Note";

export const SELECTED_CLIP_PATH = "live_set view detail_clip";

export default class Clip {
  static get MAX_NOTES() {
    return 1000;
  }

  constructor(path) {
    this.api = new LiveAPI(path);
  }

  static getSelectedClip() {
    return new Clip(SELECTED_CLIP_PATH);
  }

  desync() {
    this._exists = null;
    this._isMidi = null;
    this._length = null;
    this._start = null;
    this._end = null;
  }

  get exists() {
    return (this._exists = this._exists || this.api.id !== "0");
  }

  get isMidi() {
    if (!this.exists) return false;
    if (this._isMidi == null) {
      const value = this.api.get("is_midi_clip");
      this._isMidi = Boolean(value instanceof Array ? value[0] : value); // api quirk
    }
    return this._isMidi;
  }

  get length() {
    return (this._length = this._length || Number(this.api.get("length")));
  }

  get start() {
    return (this._start = this._start || Number(this.api.get("loop_start")));
  }

  get end() {
    return (this._end = this._end || Number(this.api.get("loop_end")));
  }

  get selectedNotes() {
    const data = this.api.call("get_selected_notes_extended");
    const notes = JSON.parse(data).notes.map(Note.fromLiveAPI);
    notes.sort((n1, n2) => n1.start - n2.start || n1.pitch - n2.pitch);
    return notes;
  }

  selectAllNotes() {
    this.api.call("select_all_notes");
    return this.selectedNotes;
  }

  replaceSelectedNotes(notes) {
    if (notes.length > Clip.MAX_NOTES) {
      console.log(`Reached maximum of ${Clip.MAX_NOTES} notes. Some notes were not created.`);
      notes = notes.slice(0, Clip.MAX_NOTES);
    }
    // TODO: `apply_note modifications` cannot add new notes or delete notes
    // we need to use `add_new_notes` and `remove_notes_by_id`
    // so we'll need to keep track of which notes were deleted (compare orig to transformed lists or persist it in
    // this class) and delete them explicitly.
    const data = JSON.stringify({ notes: notes.map(note => note.toLiveAPI()) })
    this.api.call("apply_note_modifications", data);
  }
}
