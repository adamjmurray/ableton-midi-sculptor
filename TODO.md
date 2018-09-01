- Split
  - BUG: tilting and then changing gate doesn't "resplit"
  - BUG: changing halves after a split didn't resplit (creating way too many notes)
  - Make the split param auto resplit (like gate)?
  - euclid split type:
    - want a way to control the phase (AKA rotation). 3rd arg?
    - it would be nice to turn a knob after the split occurs (resplit behavior should help?) BUT, we should only
      do that if we just performed a euclid split
  - "tilt" slider:
    - should adjust the duration of notes, and maintain the gate as much as possible
    - needs some fine tuning, doesn't seem symmetrical, backwards? it's ok in one direction ,
      maybe just apply the algorithm "in reverse" for the other?

- GUI
  - Add annotations for all controls (set Set UI)
  - Use default Live 10 font size and rely on scaling to make it readable
  - Persist scaling setting in Live set (or can we figure it out from the Live API? scaling automatically would be nice)
  - Improve window sizing in Live 10
  - Don't forget to re-enable the "choose midi clip" overlay
  - Improve color scheme - the device panel (not window) button colors need improvement in Live 10

Misc
  - More tests
  - Check for updates feature (hit a 'latest version' text file on github master) - Document release process in README or DEVELOPERS.md
    - Try using the maxurl object
    - Probably need to develop this with the midi clip variator (since it's a public repo)
  - Back port some things to the MIDI clip variator
    - pitch sliding
    - shuffle bug fix (all notes same value - notes disappear)
    - check for updates
  - Edge clip for slide start time has a max start time of the clip end time (so the note is silent because it's past the end of the clip)
    Maybe we can set the max to the clip end minus a small delta
