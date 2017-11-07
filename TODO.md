- Bugs
  - SetTransformer target/property doesn't seem to initialize correctly (when editing the device, it showed note/deleted but mutest the notes when clicking "apply")
    - And similar issue with the edge behavior in the SlideTransformer. I think we just need loadbangs for most of the GUI inputs?
  - I think utils.reflectedMod is wrong for negative n - need tests!
  - "method getwind called on invalid object" error - it's from the zoom.js script. It seems harmless, but I think we can avoid the error
    if we gate the script execution on whether the window is active (and may need to trigger the script whenever the window does become active)
  - Make sure nothing blows up when there's no notes in the clip
  - Values seem to "jump" when lifting up from the x-y pad sometimes
    - Not sure much can be done? Seems like the component just has some "inertia"
  - Swap seems to malfunction sometimes because notes may need to be sorted by start time (try with a lot of notes - chop then randomize pitch)
  - Confirm set transformer's time-based pattern works with negative start times

- GUI
  - Don't forget to re-enable the "choose midi clip" overlay
  - Change color scheme to match live
    - mostly done but doesn't work quite right in Live 10
  - control labels should be capitalized (compare with built in devices)

- Refactoring
  - Rename amount1/2 to amountX/Y

- Set
  - Allow a number of notes to be set with the set pattern unit
  - allow setting 'unmuted'

- Swap
  - swap groups
    - for time-based grouping, just swap the start times whilemaintaining the rhythm (relative start times) in each group
    - for number-of-notes-based grouping, swap the start times where the group start is the start of the first note in the group
      Note: this could lead to overlap between groups and lost notes, but I'm not sure how else this could be implemneted. It's a feature ;)
    - Some kind of "fuzziness" (sensitivity?) when determining if a note should be
      included in the next group because it's start time is so close.SHould have space for this after the above is done

- Chop
  - control gate/sustain
  - chop type:
    - pick duration of each slice
    - pick number of slices
    - euclidean
  - random x-y depends on type
    - duration (min is choosen duration for each slice)
    - number (max is choosen number)
    - euclid -  show a [?] toggle next to each number box when random is on
  - "tilt" slider depends on chop type:
    - duration: start/end is choosen (or random) duration, gets progressively shorter
    - number: uses the choosen (or random) number, gets progressively shorter towards start/end
    - eucliean: offset the pattern
  - button to apply the chop to all selected notes
  - options to keep constant velocity, or fade it out/in with the duration
  - usability idea: if we just applied the chop but the scultor window hasn't lost focus, maybe the tilt slider can apply to the
    notes that were just chopped, instead of re-chopping (which I expect to be unintuitive but I'll have to test it out)