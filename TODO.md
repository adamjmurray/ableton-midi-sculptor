- Split
  - BUG: tilting and then changing gate doesn't "resplit"
  - BUG: changing halves after a split didn't resplit (creating way too many notes)
  - Make the split ("Into") param auto resplit (like gate)? Also the reverse feature for halves
  - euclid split type:
    - want a way to control the phase (AKA rotation). 3rd arg? (use swap transformer logic if possible)
    - Reverse?
  - "tilt" slider:
    - should adjust the duration of notes, and maintain the gate as much as possible
    - needs some fine tuning, doesn't seem symmetrical, backwards? it's ok in one direction ,
      maybe just apply the algorithm "in reverse" for the other?

- GUI
  - Add annotations for all controls (set Set UI)
  - Persist scaling setting in Live set (or can we figure it out from the Live API? scaling automatically would be nice)

Misc
  - More tests
  - Check for updates feature (hit a 'latest version' text file on github master) - Document release process in README or DEVELOPERS.md
    - Try using the maxurl object
    - Probably need to develop this with the midi clip variator (since it's a public repo)
  - Back port some things to the MIDI clip variator
    - pitch sliding
    - shuffle bug fix (all notes same value - notes disappear)
    - check for updates

