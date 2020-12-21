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
    if (this._replacedNotes) {
      const deletedNoteIds = this._replacedNotes.filter(note => note.deleted).map(note => note.id);
      this.api.call("remove_notes_by_id", deletedNoteIds);
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
    // TODO: all of these lazy initializers should be doing null checks
    return (this._exists = this._exists || this.api.id !== "0");
  }

  get isMidi() {
    if (!this.exists) return false;
    if (this._isMidi == null) {
      this._isMidi = this.api.get("is_midi_clip");
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
    Object.freeze(notes);
    this._notes = notes;
    return notes;
  }

  selectAllNotes() {
    this.api.call("select_all_notes");
    return this.selectedNotes;
  }

  replaceSelectedNotes(notes) {
    this._replacedNotes = notes;
    const existingNoteIds = this._notes.map(note => note.id);
    const noteIds = notes.map(note => note.id);
    const deletedNotes = this._notes.filter(note => !noteIds.includes(note.id));
    const updatedNotes = [];
    let newNotes = [];
    notes.forEach(note => {
      if (note.id != null && existingNoteIds.includes(note.id)) {
        updatedNotes.push(note);
      } else {
        newNotes.push(note);
      }
    });

    if (deletedNotes.length) {
      // TODO: this will have a problem that it will restore the original notes duration when you make the duration so
      // short the note would normally be deleted. What we need to do is adjust the edge behaviors to apply the soft
      // deletions.
      const softDeletedNoteData = JSON.stringify({
        notes: deletedNotes.map(note => Object.assign(note.toLiveAPI(), { mute: 1 }))
      });
      this.api.call("apply_note_modifications", softDeletedNoteData);
      // TODO: now we need to keep track of what's been soft deleted so we can "commit" when the mouse is lifted
    }
    if (updatedNotes.length) {
      const updatedNoteData = JSON.stringify({ notes: updatedNotes.map(note => note.toLiveAPI()) });
      this.api.call("apply_note_modifications", updatedNoteData);
    }
    if (newNotes.length) {
      if (notes.length > Clip.MAX_NOTES) {
        console.log(`Reached maximum of ${Clip.MAX_NOTES} notes. Some notes were not created.`);
        newNotes = newNotes.slice(0, Math.min(0, Clip.MAX_NOTES - updatedNotes.length));
      }
      const newNotesData = JSON.stringify({
        notes: updatedNotes.map(note => {
          const newNoteData = note.toLiveAPI();
          delete newNoteData.note_id; // not sure we actually need to do this
          return newNoteData;
        })
      });
      this.api.call("add_new_notes", newNotesData);
      // WARNING: adding any new notes loses the selection. We should only do this when splitting/generating notes.
      // TODO: select the notes just created
    }

    // If you randomize the start times with notes that are close together, sometimes notes will collide and one will
    // get deleted automatically by Live without this code deleting it. We'll get an error if we try to apply
    // note modifications to a deleted note, so we need to know the notes that were deleted. That's why we call
    // get selectedNotes again:
    return this.selectedNotes;
  }
}
