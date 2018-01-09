- Bugs
  - Some numboxes get "stuck" (usually on the first value). Check the number of steps in the inspector. It's probably too high
  - Make sure nothing blows up when there's no notes in the clip

- GUI
  - Improve window sizing (too much space on right and bottom)
  - Don't forget to re-enable the "choose midi clip" overlay
  - control labels should be capitalized (compare with built in devices)
  - test color schemes in Live 9 and 10
    - the device panel (not window) button colors need improvement in Live 10

Misc
  - More tests
  - Check for updates feature (hit a 'latest version' text file on github master) - Document release process in README or DEVELOPERS.md
    - Try using the maxurl object
    - Probably need to develop this with the midi clip variator (since it's a public repo)
  - Back port some things to the MIDI clip variator
    - pitch sliding
    - shuffle bug fix (all notes same value - notes disappear)
  - Pseudo-bug: edge clip for slide start time has a max start time of the clip end time (so it's silent)
    But I'm not sure we want to keep the end time within the clip bounds, seems too limiting.
    Maybe we can set the max to the clip end minus a small delta

- Split
  - "tilt" slider depends on chop type:
    - duration: start/end is choosen (or random) duration, gets progressively shorter
    - number: uses the choosen (or random) number, gets progressively shorter towards start/end
    - eucliean: offset the pattern
    - exponential: change how many notes before the duration is halved? (negative direction goes from 2 to 1 and then the inverse pattern?)
  - options to keep constant velocity, or fade it out/in with the duration
  - usability idea: if we just applied the chop but the scultor window hasn't lost focus, maybe the tilt slider can apply to the
    notes that were just chopped, instead of re-chopping (which I expect to be unintuitive but I'll have to test it out)
    - How about whenever performing a split, join any consecutive notes of the same pitch first, Could be tricky with gating.