import assert from 'assert';
import { Note, SlideTransformer, SpreadAnchorType, SlidableProperty } from '../../src';
describe('SlideTransformer', function () {
    var slideTransformer;
    var notes;
    beforeEach(function () {
        slideTransformer = new SlideTransformer();
    });
    function makeNotes() {
        var values = [];
        for (var _i = 0; _i < arguments.length; _i++) {
            values[_i] = arguments[_i];
        }
        return values.map(function (val) { return new Note({ start: val, pitch: val, velocity: val, duration: val }); });
    }
    function useNotes() {
        var values = [];
        for (var _i = 0; _i < arguments.length; _i++) {
            values[_i] = arguments[_i];
        }
        notes = makeNotes.apply(void 0, values);
        slideTransformer.notes = notes;
    }
    function clone(notes) {
        return notes.map(function (n) { return n.clone(); });
    }
    describe('shift()', function () {
        beforeEach(function () {
            useNotes(1, 2, 3, 4);
            slideTransformer.edgeBehavior = 'clip';
            slideTransformer.spreadAnchor = SpreadAnchorType.MIDPOINT;
        });
        it('shifts the note property values by the given range and amount ratio', function () {
            var expected = clone(notes);
            expected.forEach(function (note) { return note.pitch = note.pitch + 5; });
            slideTransformer.setRange(SlidableProperty.PITCH, 5);
            assert.deepEqual(slideTransformer.shift(SlidableProperty.PITCH, 1.0), expected);
        });
    });
});
