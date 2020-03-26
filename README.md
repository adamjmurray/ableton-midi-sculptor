Work in progress!

# Ableton MIDI Sculptor

![Node.js CI](https://github.com/adamjmurray/ableton-midi-sculptor/workflows/Node.js%20CI/badge.svg)

The **Ableton MIDI Clip Sculptor**
is a [Max for Live device](http://ableton.com/maxforlive)
for [Ableton Live](http://ableton.com/live/)
that makes it easy to create variations of MIDI clips with tools to modify pitch, velocity, and timing.

TODO: Screenshot


## Installation and Usage

1. [Download](TODO: from where?) and unzip in the location of your choice
2. Drag the ableton-midi-sculptor.amxd device into any MIDI track
3. Click the help button for usage instructions


## Features

* Opens a floating window that stays on top of Ableton Live, so you can quickly jump between different clips
  * Zoomable interface
* Slide transformations:
  * Operate on one of pitch, velocity, start time, or duration
  * Randomize the values with an intuitive 2-dimensional randomization control
  * Shift the values of selected notes (e.g. raise or lower the pitch)
  * Spread the values towards or away from the average value
    * Options to spread to/from the min, average, or max value
  * Set the range of the transformation (e.g. only shift start times by a certain number of beats)
  * Options to clip, rotate (AKA wrap-around), reflect, or remove notes that exceed a min or max value (e.g. what to do if the pitch goes negative)
* Swap transformations:
  * Operate on a combination of pitch, velocity, and duration
  * Randomly swap the selected properties while keeping the start times the same
  * "Rotate" the selected properties while keeping the start times the same (e.g. copy the pitch, velocity, and/or duration from each note to the following note)
  * Reverse the selected properties across the notes (e.g. the last note gets the first note's pitch and vice versa)
  * Swap consecutive pairs of notes
  * "Zip" the notes by alternating the selected values from the two sequential halves of the notes
* Set trasnformations:
  * Randomly delete, mute, or unmute notes for "thinning out" a busy clip
  * Delete, mute, or unmute all selected notes
  * Set a given pitch, velocity, start time, or duration on a random set of notes
  * Set a given pitch, velocity, start time, or duration on all selected notes
* Split transformations:
  * Split a note into many notes using several different rules:
    * Split a note into a given number of notes
    * Split the note at a given timee interval
    * Spit the note into Euclidean rhythms
    * Split the note into exponentially shorter or longer durations (e.g. make a Trance snare roll build-up that doubles in speed every few beats)
  * Control the gate (relative duration) of each created note
  * Apply a velocity envelope across the created notes (e.g. fade in or fade out)
  * "Tilt" the notes to shift the timing towards the start or end


## Changelog



## About

Designed and developed by [Adam Murray](https://github.com/adamjmurray).

Released under a [permissive free software license](https://github.com/adamjmurray/ableton-midi-sculptor/blob/master/LICENSE.txt)

Built with [Max](http://cycling74.com/products/max/) and JavaScript.
