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
      const deletedNoteIds = this._replacedNotes.filter(note => note.deleted).map(note => note.id);
      if (deletedNoteIds.length) {
        // This creates an extra undo step but it seems unavoidable with the soft deletion
        // strategy used to avoid losing MPE data as soon as a note disappears.
        this.api.call("remove_notes_by_id", ...deletedNoteIds);
        this._replacedNotes = null;
      }
    }
    this._exists = null;
    this._isMidi = null;
    this._length = null;
    this._start = null;
    this._end = null;
    this._notes = null;
    this._deletionTime = null;
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

  get deletionTime() {
    // Soft deleted notes are muted, drastically shrank in duration, and moved to pitch 0 in a certain time slot.
    // This logic attempts to find a safe time slot that doesn't overwrite notes or interfere with a transformation.
    if (this._deletionTime == null) {
      // Look for the earliest note before the clip start and use the time slot ~2 clip lengths before that.
      // The assumption is longer clips will use higher range time transformations so we want a bigger buffer.
      // Search 256 measures before the start of the clip. I don't know why anyone would put notes that far back.
      const earliestStart = this.getNotes(0, 128, this.start - 1024, 1024)[0]?.start ?? this.start;
      this._deletionTime = earliestStart - Math.max(2 * this.length, 16); // minimum of 4 measures
    }
    return this._deletionTime;
  }

  getNotes(start_pitch, pitch_range, start_time, time_range) {
    return Note.listFromLiveAPI(
      this.api.call("get_notes_extended", start_pitch, pitch_range, start_time, time_range)
    );
  }

  get selectedNotes() {
    const notes = Note.listFromLiveAPI(this.api.call("get_selected_notes_extended"));
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

    // use reduce() to process each pair of consecutive notes (rather than actually reduce to a value)
    notes.reduce((prev, note) => {
      if (note.deleted) {
        return prev; // Compare the next note against the last non-deleted note
      } else if (prev?.pitch == note.pitch && note.start < prev.end) {
        // Shrink the previous note. We have to ensure the end of the previous note is
        // a little before the start of this one, or Live might automatically delete it
        // and then all calls to apply_note_modifications fail because of an invalid note_id.
        prev.duration = note.start - prev.start - 0.00001;
        // Be aware that in Note.toLiveAPI(), it will be soft deleted if it's too short
      }
      return note;
    }, null);

    this.api.call("apply_note_modifications",
      JSON.stringify({
        // TODO: Make sure nothing is at pitch 0 that we're overwriting. toLiveAPI() takes a deletion pitch...
        notes: notes.map(note => note.toLiveAPI(this.deletionTime)),
      })
    );

    // Keep track of the soft-deletions so we can hard-delete on desync():
    this._replacedNotes = notes;
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
