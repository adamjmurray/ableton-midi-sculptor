import assert from 'assert';
import { Clip, Note } from '../src';
function makeNotes() {
    var values = [];
    for (var _i = 0; _i < arguments.length; _i++) {
        values[_i] = arguments[_i];
    }
    return values.map(function (val) { return new Note({ start: val, pitch: val, velocity: val, duration: val }); });
}
function returnNotes(notes) {
    var apiNotes = ['notes', notes.length];
    for (var _i = 0, notes_1 = notes; _i < notes_1.length; _i++) {
        var note = notes_1[_i];
        apiNotes.push('note', note.pitch, note.start, note.duration, note.velocity, note.muted ? 1 : 0);
    }
    apiNotes.push('done');
    return apiNotes;
}
describe('Clip', function () {
    var clip;
    beforeEach(function () { return clip = new Clip(Clip.SELECTED_CLIP_PATH); });
    describe('selectedNotes', function () {
        it('returns the notes in the clip in sorted order (by time, pitch)', function () {
            LiveAPI.handleCall('get_selected_notes', function () { return returnNotes(makeNotes(3, 2, 1)); });
            assert.deepEqual(makeNotes(1, 2, 3), clip.selectedNotes);
        });
    });
});
