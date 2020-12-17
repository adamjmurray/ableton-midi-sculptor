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
    // TODO: Do something if the incoming note list exceeds MAX_NOTES (at least print a warning)
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
      // TODO: only slice out new notes
    }

    const existingNoteIds = this._notes.map(note => note.id);
    const noteIds = notes.map(note => note.id);
    const deletedNotes = this._notes.filter(note => !noteIds.includes(note.id));
    const updatedNotes = [];
    const newNotes = [];
    notes.forEach(note => {
      if (note.id != null && existingNoteIds.includes(note.id)) {
        updatedNotes.push(note);
      } else {
        newNotes.push(note);
      }
    });

    // TODO: Actually deleting notes with `remove_notes_by_id` is semi-workable, but if you keep dragging the mouse in
    // such a way as to "undo" the deletion, the notes in memory in the transformers still have the original ID . We'll
    // try to update the note but it no longer exists, which causes an error.
    // We need to "soft delete" the notes by muting and "commit "the deletion when the mouse is lifted (when we desync)
    // Alternately we could full resync the notes by calling get selectedNotes at the end of this function but
    // (1) I worry about the performance impact and (2) if we do hard delete notes before "committing" all MPE data
    // will be lost if we drag the mouse to undo.
    if (deletedNotes.length) {
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
      console.log('adding notes:', newNotes);
      const newNotesData = JSON.stringify({
        notes: updatedNotes.map(note => {
          const newNoteData = note.toLiveAPI();
          delete newNoteData.note_id; // not sure we actually need to do this
          return newNoteData;
        })
      });
      const addResult = this.api.call("add_new_notes", newNotesData);
      console.log({ addResult }); // this is useless: just returns ["id", 0]. Feature request to return the ids?
      // TODO: after adding any new notes we're going to have to call getSlectedNotes to get their ids
      // BUT: I don't actually know if the new notes will be selected, so this might be pretty difficult
      // We don't actually need this code until the split features are released, and as long as we don't keep adding new
      // notes as you drag the mouse, we shouldn't really need to worry about getting the IDs. We may need to select
      // the notes to handle the tilt feature though, which might be tricky. Worst case we just rework that into a
      // tension control you need to choose before splitting. Need to experiment.
      //
      // Worse than I thought: it seems adding any new notes loses the selection.
    }

    // WARNING: After switching to soft deletion there is still a pretty serious issue:
    // If you randomize the start times with notes that are close together, sometimes notes will collide and one will
    // get deleted automatically by Live without this code deleting it. Once again we are in the situation where
    // we're trying to apply note modifications with a non-existent ID. The easiest solution is probably to get selected
    // notes again after each update and hope its performant.

    // Final notes after some experimentation:
    // - If we randomize start time and let notes overlap, Live will delete them
    // - If we want to restore them as we keep dragging the random x-y pad, we need to add notes but
    // - Adding notes loses the selection.

    // this._notes = Object.freeze(notes.slice());

    return this.selectedNotes;
  }
}
