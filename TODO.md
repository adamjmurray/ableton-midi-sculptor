- Split
  - exponential split type
    - 2 args: num notes before division, and number of divisions.
    - Ex: 4 and 2 would give [x...x...x...x...x.x.x.x.xxxxxxxx]
  - euclid split type
    - want a way to control the phase (AKA rotation). 3rd arg? But it would be nice to turn a knob after the split occurs
  - "tilt" slider:
    - take the current notes, keep the earliest and latest note starts, and map every other note with an exponential curve

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
  - Edge clip for slide start time has a max start time of the clip end time (so the note is silent because it's past the end of the clip)
    Maybe we can set the max to the clip end minus a small delta
