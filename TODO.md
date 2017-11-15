
- Bugs
  - Some numboxes get "stuck" (usually on the first value). Check the number of steps in the inspector. It's probably too high
  - Make sure nothing blows up when there's no notes in the clip
  - Values seem to "jump" when lifting up from the x-y pad sometimes
    - Not sure much can be done? Seems like the component just has some "inertia"
  - FIXED? TEST: Swap seems to malfunction sometimes because notes may need to be sorted by start time (try with a lot of notes - chop then randomize pitch)
  - swap group targetting probably has bugs when the clip start is not 0 (see TODO comment)
  - Confirm set transformer's time-based pattern works with negative start times
    - Both these issues can be fixed by making all note times relative to clip start

- GUI
  - Don't forget to re-enable the "choose midi clip" overlay
  - Change color scheme to match live
    - mostly done but doesn't work quite right in Live 10
  - control labels should be capitalized (compare with built in devices)

Misc
  - More tests
  - Check for updates feature (hit a 'latest version' text file on github master) - Document release process in README or DEVELOPERS.md
  - Back port some things to the MIDI clip variator
    - pitch sliding
    - shuffle bug fix (all notes same value - notes disappear)

- Swap
  - swap groups
    - Some kind of "fuzziness" (sensitivity?) when determining if a note should be
      included in the next group because it's start time is so close.SHould have space for this after the above is done

- Set
  - should the pattern apply to the randomization behavior too? Make it a toggle? Over-engineering this thing?

- Chop
  - rename chop to slice?
  - chop type:
    - exponential (halve the duration every N notes) - but maybe this can be handled by the tilt slider?
  - random x-y depends on type
    - duration (min is choosen duration for each slice)
    - number (max is choosen number)
    - euclid -  show a [?] toggle next to each number box when random is on
  - "tilt" slider depends on chop type:
    - duration: start/end is choosen (or random) duration, gets progressively shorter
    - number: uses the choosen (or random) number, gets progressively shorter towards start/end
    - eucliean: offset the pattern
  - options to keep constant velocity, or fade it out/in with the duration
  - usability idea: if we just applied the chop but the scultor window hasn't lost focus, maybe the tilt slider can apply to the
    notes that were just chopped, instead of re-chopping (which I expect to be unintuitive but I'll have to test it out)