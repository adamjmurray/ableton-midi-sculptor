import assert from 'assert';
import { Clip, Note, SplitTransformer } from '../../src';
var n = function (opts) { return new Note(opts); };
describe('SplitTransformer', function () {
    var splitTransformer;
    beforeEach(function () { return splitTransformer = new SplitTransformer(); });
    describe('split()', function () {
        context('"note" type', function () {
            it('splits the note into the given number of notes', function () {
                splitTransformer.gate = 1;
                splitTransformer.setSplitType('note', 2);
                splitTransformer.notes = [new Note({ start: 0, duration: 1 })];
                var expected = [n({ start: 0, duration: 0.5 }), n({ start: 0.5, duration: 0.5 })];
                assert.deepEqual(splitTransformer.split(), expected);
            });
            it('splits the note into the given number of notes with minimal round-off error', function () {
                splitTransformer.gate = 1;
                splitTransformer.setSplitType('note', 11);
                splitTransformer.notes = [new Note({ start: 0, duration: 3 })];
                var expected = new Array(11).fill(0)
                    .map(function (_, index) { return n({ start: 3 / 11 * index, duration: 3 / 11 }); });
                assert.deepEqual(splitTransformer.split(), expected);
            });
            it("doesn't split into more than Clip.MAX_NOTES", function () {
                splitTransformer.gate = 1;
                splitTransformer.setSplitType('note', Clip.MAX_NOTES + 1);
                splitTransformer.notes = [new Note({ start: 0, duration: 1 })];
                assert.equal(splitTransformer.split().length, Clip.MAX_NOTES);
            });
        });
    });
});
