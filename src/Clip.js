import Note from "./Note";

export const SELECTED_CLIP_PATH = "live_set view detail_clip";


export default class Clip {
  static get MAX_NOTES() {
    return 1000;
  }

  constructor(path) {
    this.api = new LiveAPI(path);
  }

  static get selectedClip() {
    return new Clip(SELECTED_CLIP_PATH);
  }

  desync() {
    if (this._replacedNotes) {
      // This creates an extra undo step but it seems unavoidable.
      const deletedNoteIds = this._replacedNotes.filter(note => note.deleted).map(note => note.id);
      this.api.call("remove_notes_by_id", ...deletedNoteIds);
      this._replacedNotes = null;
    }
    this._exists = null;
    this._isMidi = null;
    this._length = null;
    this._start = null;
    this._end = null;
    this._notes = null;
  }

  get exists() {
    return this._exists ??= this.api.id !== "0";
  }

  get isMidi() {
    return this._isMidi ??= this.exists && this.api.get("is_midi_clip");
  }

  get length() {
    return this._length ??= Number(this.api.get("length"));
  }

  get start() {
    return this._start ??= Number(this.api.get("loop_start"));
  }

  get end() {
    return this._end ??= Number(this.api.get("loop_end"));
  }

  get selectedNotes() {
    const data = this.api.call("get_selected_notes_extended");
    const notes = JSON.parse(data).notes.map(Note.fromLiveAPI);
    notes.sort((n1, n2) => n1.start - n2.start || n1.pitch - n2.pitch);
    Object.freeze(notes);
    this._notes = notes;
    return notes;
  }

  selectAllNotes() {
    this.api.call("select_all_notes");
    return this.selectedNotes;
  }

  updateSelectedNotes(notes) {
    // Don't destructively modify the input:
    notes = notes.map(note => note.clone());

    // Sort by pitch and then by start time:
    notes.sort((n1, n2) => n1.pitch - n2.pitch || n1.start - n2.start);

    notes.reduce((prev, note) => { // Apply soft deletions...
      if (note.deleted || // ...to notes deleted by the transformer...
        (prev?.pitch == note.pitch && note.start < prev.end) // ...and overlapping notes.
      ) {
        note.deleted = true;
        return prev; // Compare the next note against the last non-deleted note
      }
      else return note;
    }, null);

    this.api.call("apply_note_modifications",
      JSON.stringify({
        // !!! TODO: Make sure nothing is at pitch 0 that we're overwriting. toLiveAPI() takes a deletion pitch !!!
        notes: notes.map(note => note.toLiveAPI()),
      })
    );

    // Keep track of the soft-deletions so we can hard-delete on desync():
    this._replacedNotes = notes;

    // // TODO: Make this more efficient? Hopefully it's not needed though! Leaving here for debugging.
    // const updatedNotes = this.selectedNotes;
    // if (updatedNotes.length < notes.length) {
    //   console.log("WARNING: Some notes were unexpected deleted.");
    //   console.log('note modifications:', apiData);
    //   console.log('result:', updatedNotes);
    //   // TODO: If this happens, we can't attempt to update hard-deleted notes
    //   // and this._replacedNotes has to omit the deleted notes.
    // }
    // return updatedNotes;
  }

  addNotes(notes) {
    const newNotesData = JSON.stringify({
      notes: notes.map(note => {
        const data = note.toLiveAPI();
        delete data.note_id; // TODO: not sure we actually need to do this
        return data;
      })
    });
    this.api.call("add_new_notes", newNotesData);
  }

  deleteNotes(notes) {
    this.api.call("remove_notes_by_id", ...notes.map(n => n.id));
  }

  deleteAllNotes() {
    this.api.call("select_all_notes");
    const data = this.api.call("get_selected_notes_extended");
    const notes = JSON.parse(data).notes.map(Note.fromLiveAPI);
    this.api.call("remove_notes_by_id", ...notes.map(n => n.id));
  }

}
