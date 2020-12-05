Bugs
- Adding the device creates ~3 unnecessary undo history states
- When moving a clip to another track, an unnecesary undo history state is created
- "Flicking" the mouse can shift an additional time at the maximum amount

Ideas
- Slide
  - "Fade" (crescendo/decrescendo) mode changes velocity based on start time
- Swap
  - Grouping (time based and note number based)
- Split
  - Restore the tab (add 'split' back to the live.tab's range/enum)
  - BUG: tilting and then changing gate doesn't "resplit"
  - BUG: changing halves after a split didn't resplit (creating way too many notes)
  - BUG: Randomized swap can result in duplicate notes (when one note is randomly selected and then set to the values of a note that is not randomly selected), so it's not actually swapping.
  - Make the split ("Into") param auto resplit (like gate)? Also the reverse feature for halves
  - euclid split type:
    - want a way to control the phase (AKA rotation). 3rd arg? (use swap transformer logic if possible)
    - Reverse?
  - "tilt" slider:
    - should adjust the duration of notes, and maintain the gate as much as possible
    - needs some fine tuning, doesn't seem symmetrical, backwards? it's ok in one direction ,
      maybe just apply the algorithm "in reverse" for the other direction?
- Misc
  - Help window (semi-implemented, currently hidden)
  - Show number of notes selected. Maybe show warning when only 1 is selected.
  - More tests.
    - Get the controller under test (integration tests)
