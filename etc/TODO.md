Bugs
- Adding the device creates ~3 unnecessary undo history states

Ideas
- Slide
  - "Strum" mode (new drop down option)
    - Changes start time based on pitch
      - with anchor='start', the lowest note will not move and the highest note will move by the range. in between notes will be scaled by their position within the sorted list of pitches present (_not_ scaled by the pitch value to account for gaps in a chord)
      - similarly, with anchor='end', the highest note will not move and 'mid' will not move the midpoint
      - using "shift" will scale things linearly for a "straight" strum
      - using "spread" will scale things exponentially (do we need to control "tension"?)
      - the randomize will respect the anchor point behavior but randomize the actual value within the movable range for each note (which are still scaled by pitch? probably not?)
  - "Fade" (crescendo/decrescendo) mode
    - Changes velocity based on start time
    - anchor='start' will keep the first note veloicty the same and move the last note by the range
    - like "strum", "shift" is linear and "spread" is exponential
  - Notes on "strum" and "fade": I think we want to control the exponential factor (the "tension") but I'm struggling with how to work that into the UI. It would be cool if the "spread" slider controlled this, but it would have to operate on the assumption the first and last note are already in the desired position. Which means it wouldn't do anything for notes with equal pitches (or velocities for "fade") unless you already applied "shift". That might be ok. In these modes, we could rename "spread" to "tension". I thought about introducing a tension dial at the bottom but it's kind of cramped.
- Swap
  - Maybe implement grouping (time based and note number based) in the swap transformer
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
  - Check for updates feature (hit a 'latest version' text file on github master) - Document release process in README or DEVELOPERS.md
    - Try using the maxurl object
