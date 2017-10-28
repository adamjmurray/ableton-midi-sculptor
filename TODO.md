- Bugs
  - Slide spread deletes notes when notes have the same value

- GUI
  - Change color scheme to match live
    - mostly done but doesn't work quite right in Live 10

- Slide
  - anchor spread operation to lowest or highest value (default is the average value)

- Swap
  - Swap pitch, velocity, duration, start in any combination
  - rotate slider to contiuously rotate the selected params around the selection
  - Randomization x-y control - swap random notes 
  - buttons to do swap operations:
    - flip
    - pairs (next to each other)
    - zip (interleave first and second half)
  - groupings
    - turn off or divide clip into consecutive groups based on number of notes or time
    - put any extra notes in the first group, last group, random group, or a new group (when grouping by num notes)
    - toggle to control scope, whether all operations apply within each group or to the groups themselves (swap entire groups)
      NOTE: when swapping entire groups, the number of notes may be different, so we might have to swap all parameters when the
      scope is set to "groups", and might want to gray out parameter controls

- Set
  - Choose a parameter (pitch, velocity, duration, start) and a value
  - One of the parameters is "delete" which randomly deletes notes (basically this is a convenient shortcut for duration 0)
  - Click "Set" to set selected notes
  - randomize x-y control

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