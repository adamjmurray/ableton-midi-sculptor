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
    const updatedNotes = [];
    let newNotes = [];
    notes.forEach(note => {
      if (note.id != null && existingNoteIds.includes(note.id)) {
        updatedNotes.push(note);
      } else {
        newNotes.push(note);
      }
    });

    if (updatedNotes.length) {
      const updatedNoteData = JSON.stringify({ notes: updatedNotes.map(note => note.toLiveAPI()) });
      this.api.call("apply_note_modifications", updatedNoteData);
    }

    // TODO: When randomizing start time, if one note completely covers another, it will delete it,
    // then if we keep randomizing and it comes back, we'd need to add the new notes.
    // But this has the problem that it loses the selection. We could try to reselect the range but there
    // is also the major downside that we'll lose all expression data as soon as the note is deleted and we
    // can't recreate it when adding the note. Therefore, we are going to send all the deleted notes to a
    // "waiting area", like at -1 time at pitch 0, with the duration of the note really short so we can stack
    // a bunch of them there, and from there we can restore as needed if you keep dragging the random x-y control.
    // To pull this off, we will need a note collision algoritm to determine when a note will be deleted.

    // if (newNotes.length) {
    //   console.log('Warning: adding new notes not properly supported yet!');
    //   if (notes.length > Clip.MAX_NOTES) {
    //     console.log(`Reached maximum of ${Clip.MAX_NOTES} notes. Some notes were not created.`);
    //     newNotes = newNotes.slice(0, Math.min(0, Clip.MAX_NOTES - updatedNotes.length));
    //   }
    //   const newNotesData = JSON.stringify({
    //     notes: updatedNotes.map(note => {
    //       const newNoteData = note.toLiveAPI();
    //       delete newNoteData.note_id; // not sure we actually need to do this
    //       return newNoteData;
    //     })
    //   });
    //   this.api.call("add_new_notes", newNotesData);
    //   // WARNING: adding any new notes loses the selection. We should only do this when splitting/generating notes.
    //   // TODO: select the notes just created
    // }

    // If you randomize the start times with notes that are close together, sometimes notes will collide and one will
    // get deleted automatically by Live without this code deleting it. We'll get an error if we try to apply
    // note modifications to a deleted note, so we need to know the notes that were deleted. That's why we call
    // get selectedNotes again:
    return this.selectedNotes;
  }
}
