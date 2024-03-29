# MIDI Sculptor for Ableton Live

The **MIDI Sculptor**
is a [Max for Live device](http://ableton.com/maxforlive)
for [Ableton Live](http://ableton.com/live/)
that makes it easy to create variations of MIDI clips with tools to modify pitch, velocity, and timing.

![Sculptor Demo](./etc/sculptor.gif)

## Installation and Usage

1. [Download Sculptor.amxd v2.0 beta 2](./releases/2.0-beta-2/Sculptor.amxd?raw=true) for Live 11
   * Or [Download Sculptor.amxd v1.1](./releases/1.1/Sculptor.amxd?raw=true) for Live 10 
2. Drag the `Sculptor.amxd` device onto any MIDI track
3. Click the "Sculpting Tools" button to open the main UI in a window
4. Adjust the zoom level as desired
5. Open Live's Info View and hover over any control for documentation


## Features

Some of the things you can do with this device:
* Randomize the timing and velocity of notes within a controllable range.
* Strum chords by making simultaneous notes play in quick succession.
* Compress velocity ranges to tame wild recordings with notes that are too quiet or too loud, or spread the velocities farther apart for more dynamic range.
* Reverse all the pitches without changing timing or velocity.
* Randomly swap notes in a drum rack clip for sonic variations with the same timing as the original.
* Randomly delete notes to "thin out" a clip to create lower energy variations.
* Randomize in all sorts of ways to experiment and overcome writer's block.


### Device Panel

![Sculptor Device](./etc/sculptor.png)

* The "Sculpting Tools" button opens the main UI in a **floating window** (always on top of Live), so you can jump between different clips and keep editing.
* The UI is **zoomable** for high resolution monitors.
* Sculpting operations apply to the **selected notes** of the clip, so you can control what's affected.
  * _Note: If nothing is happening, it's probably because you only have one note selected._


### There are **3 sculpting tools**.

### Slide Tool

![Sculptor Device](./etc/slide.png)

* Operate on the **pitch**, **velocity**, **start time**, or **duration** of the selected notes.
* Set a **maximum range** of the operation.
* **Shift** moves the chosen note property in the positive or negative direction
* **Randomize** moves the chosen note property in a random direction by a random amount (within the chosen range)
  * Every time you use the randomize X-Y pad, a new random value is chosen for each corner. You can "scrub" around looking for sweet spots. Once you let go of the mouse, new random values will be chosen.
* **Spread** spreads the chosen note properties closer together or farther apart.
* **Edge behavior** (the 4 buttons in the lower left) determines what happens when a note hits the minimum or maximum value:
  * **Clamp** holds the note property at its minimum/maximum value
  * **Reflect** "bounces" off the edge and moves in the opposite direction
  * **Wrap** wraps around from the minimum to maximum value and vice versa
  * The "**keep going**" option lets notes move off the edge of the clip and removes notes with negative velocities or invalid pitches
* **Spread anchor behavior** (the 3 buttons in the lower right) controls the spread operation:
  * **Lowest**: don't move the note with the lowest value
  * **Middle**: don't move the note with the average value. In other words, spread away from / towards the center.
  * **Highest**: don't move the note with the highest value

#### New in version 1.1

A **Strum** option in the Slide Tool moves notes based on their relative pitch.

![Sculptor Device](./etc/strum.gif)

* Strum the **start or end time** of notes.
* **Lock** the **duration** or **end position**.
* **Anchor** to the **lowest** or **highest** note, or strum around the **middle**.
* Change the tension to **accelerate** or **decelerate** the strum.


### Swap Tool

![Sculptor Device](./etc/swap.png)

* Operate on **a combination of pitch, velocity, and duration**. Start times do not change.
* **Rotate** copies the chosen note properties from one note to the next while keeping the start times the same. The rotation wraps around the end of the clip.
* **Randomly swap** the chosen note properties while keeping the start times the same
  * Every time you use the randomize X-Y pad, new random swap targets are chosen for each corner. You can "scrub" around looking for sweet spots. Once you let go of the mouse, new random targets will be chosen.
* Swap the chosen note properties between **consecutive pairs** of notes.
* **Reverse** the chosen note properties across the notes (e.g. the last note gets the first note's pitch and vice versa)
* **"Zip"** the chosen note properties by splitting the list of notes into two halves and interleaving the halves.


### Set Tool

![Sculptor Device](./etc/set.png)

* Randomly **delete, mute, or unmute notes** for "thinning out" a busy clip
* Set the chosen **pitch**, **velocity**, **start time**, or **duration** on a **random set of notes**
* Set the chosen note property to the chosen value value on **all the selected notes**


## Feature Requests and Bug Reports

Please file a github issue: https://github.com/adamjmurray/ableton-midi-sculptor/issues


## Support this Project

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=8CZDHHJ5WF4WA&currency_code=USD&source=url)


## About

Designed and developed by [Adam Murray](https://github.com/adamjmurray).

Released under the [GNU General Public License v3.0](https://github.com/adamjmurray/ableton-midi-sculptor/blob/master/LICENSE.txt). This device is free to use and does not impose royalties on music created with it. You may not sell this device as part of a closed source commercial product. If you use this device or a modified form of this device in another software project, the project must be open source and include this license.

Built with [Max](http://cycling74.com/products/max/) and JavaScript.

![Node.js CI](https://github.com/adamjmurray/ableton-midi-sculptor/workflows/Node.js%20CI/badge.svg)
