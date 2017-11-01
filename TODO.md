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

- GUI
  - Don't forget to re-enable the "choose midi clip" overlay
  - Change color scheme to match live
    - mostly done but doesn't work quite right in Live 10
  - control labels should be capitalized (compare with built in devices)

- Refactoring
  - Rename amount1/2 to amountX/Y

- Set
  - Controls to set/not set values in a repeating pattern using a toggle grid with an adjustable length
    - The pattern can be applied to either the notes (e.g. every other note) or all the notes within a cretain time unit
      (e.g. every other beat)

- Swap
  - ditch swap property and replace with dropdown:
    - notes
    - groups (see below)
    - pitches
    - velocities
    - durations
    - pitch + velocity
    - pitch + duration
    - velocity + duration
  - groupings
    - toggle to control scope, whether all operations apply within each group or to the groups themselves (swap entire groups)
      NOTE: when swapping entire groups, the number of notes may be different, so we might have to swap all parameters when the
      scope is set to "groups", and might want to gray out parameter controls
      This seems tricky. Later...
      One idea for toggling this is to select every target (which normally does nothing). Kind of hidden, but there isn't much room for this toggle
      So when you "swap" groups I guess we are talking about swapping their start times relative to the min start time of the group
    - Some kind of "fuzziness" (sensitivity?) when determining if a note shoudl be
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