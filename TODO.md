- Split
  - BUG: tilting and then chaing gate doesn't replit (chang gate in realtime)
  - BUG: changing exp after a split didn't resplit (creating way too many notes)
  - BUG: trying to create too many notes froze the device (put a limit on notes created?)
  - Rename exp to halves
  - Make the split param auto resplit (like gate)?
  - euclid split type:
    - want a way to control the phase (AKA rotation). 3rd arg? But it would be nice to turn a knob after the split occurs (resplit behavior should help?)
  - "tilt" slider:
    - should adjust the duration of notes, and maintain the gate as much as possible
    - needs some fine tuning, doesn't seem symmetrical, backwards? it's ok in one direction , maybe just apply the algorithm "in reverse" for the other?

- GUI
  - Some numboxes get "stuck" (usually on the first value). Check the number of steps in the inspector. It's probably too high
  - Use default Live 10 font size and rely on scaling to make it readable
  - Persist scaling setting in Live set (or can we figure it out from the Live API?)
  - Improve window sizing (too much space on right and bottom)
  - Don't forget to re-enable the "choose midi clip" overlay
  - control labels should be capitalized (compare with built in devices)
  - test color schemes in Live 9 and 10
    - the device panel (not window) button colors need improvement in Live 10

Misc
  - More tests
     - Make sure nothing blows up when there's no notes in the clip
  - Check for updates feature (hit a 'latest version' text file on github master) - Document release process in README or DEVELOPERS.md
    - Try using the maxurl object
    - Probably need to develop this with the midi clip variator (since it's a public repo)
  - Back port some things to the MIDI clip variator
    - pitch sliding
    - shuffle bug fix (all notes same value - notes disappear)
    - check for updates
  - Edge clip for slide start time has a max start time of the clip end time (so the note is silent because it's past the end of the clip)
    Maybe we can set the max to the clip end minus a small delta
