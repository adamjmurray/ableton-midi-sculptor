1.0
- Hide Split panel, it needs too much more work
- Make Slide's bottom row of buttons same height
- Cleanup panel widths
- Cleanup layouts for swap and set
- Add annotations for all controls
- Update README
- Change license to be less permissive? No commercial derivatives?
- Back port some things to the MIDI clip variator
  - ! Probably not doing this. Just update the README in that repo to point here
  - pitch sliding
  - shuffle bug fix (all notes same value - notes disappear)
  - check for updates

Future
- Slide
  - Add tilt feature. Unlike drawing a straight line in Ableton's velocity panel, this will maintain the ratios between notes
- Swap
  - Maybe implement grouping (time based and note number based) in the swap transformer
- Split
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
  - More tests.
    - Get the controller under test
  - Check for updates feature (hit a 'latest version' text file on github master) - Document release process in README or DEVELOPERS.md
    - Try using the maxurl object
    - Probably need to develop this with the midi clip variator (since it's a public repo)
