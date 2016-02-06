// MIDI Clip Variator
// Copyright 2016 Adam Murray
// License: https://github.com/adamjmurray/ableton-midi-clip-variator/blob/master/LICENSE.txt

//--------------------------------------------------------------------------------------
// Utils

function log() {
  for (var i = 0, len = arguments.length; i < len; i++) {
    var message = arguments[i];
    if (message && message.toString) {
      var s = message.toString();
      if (s.indexOf("[object ") >= 0) {
        s = JSON.stringify(message);
      }
      post(s);
    } else if (message === null) {
      post("<null>");
    } else {
      post(message);
    }
  }
  post("\n");
}

log("___________________________________________________");
log("Reload:", new Date);

//--------------------------------------------------------------------------------------
// Clip class

function Clip(path) {
  this.liveObject = new LiveAPI(path);
}

Clip.prototype.exists = function() {
  return this.liveObject.id != 0;
};

Clip.prototype.getLength = function() {
  return this.liveObject.get("length");
};

Clip.prototype._parseNoteData = function(data) {
  var notes = [];
  // data starts with "notes"/count and ends with "done" (which we ignore)
  for (var i = 2, len = data.length - 1; i < len; i += 6) {
    // and each note starts with "note" (which we ignore) and is 6 items in the list
    var note = new Note(data[i + 1], data[i + 2], data[i + 3], data[i + 4], data[i + 5]);
    notes.push(note);
  }
  return notes;
};

Clip.prototype.getSelectedNotes = function() {
  var data = this.liveObject.call("get_selected_notes");
  return this._parseNoteData(data);
};


Clip.prototype.getNotes = function(startTime, timeRange, startPitch, pitchRange) {
  if (!startTime) startTime = 0;
  if (!timeRange) timeRange = this.getLength();
  if (!startPitch) startPitch = 0;
  if (!pitchRange) pitchRange = 128;

  var data = this.liveObject.call("get_notes", startTime, startPitch, timeRange, pitchRange);
  return this._parseNoteData(data);
};

Clip.prototype._sendNotes = function(notes) {
  var liveObject = this.liveObject;

  liveObject.call("notes", notes.length);

  notes.forEach(function(note) {
    liveObject.call("note", note.getPitch(),
                    note.getStart(), note.getDuration(),
                    note.getVelocity(), note.getMuted());
  });
  liveObject.call("done");
};

Clip.prototype.replaceSelectedNotes = function(notes) {
  this.liveObject.call("replace_selected_notes");
  this._sendNotes(notes);
};

Clip.prototype.setNotes = function(notes) {
  this.liveObject.call("set_notes");
  this._sendNotes(notes);
};

Clip.prototype.selectAllNotes = function() {
  this.liveObject.call("select_all_notes");
};

Clip.prototype.replaceAllNotes = function(notes) {
  this.selectAllNotes();
  this.replaceSelectedNotes(notes);
};

//--------------------------------------------------------------------------------------
// Note class

function Note(pitch, start, duration, velocity, muted) {
  this.pitch = pitch;
  this.start = start;
  this.duration = duration;
  this.velocity = velocity;
  this.muted = muted;
}

Note.MIN_DURATION = 1 / 128;

Note.prototype.toString = function() {
  return "Note{pitch:" + this.pitch +
    ",start:" + this.start +
    ",duration:" + this.duration +
    ",velocity:" + this.velocity +
    ",muted:" + this.muted + "}";
};

Note.prototype.getPitch = function() {
  if (this.pitch < 0) return 0;
  if (this.pitch > 127) return 127;
  return this.pitch;
};

Note.prototype.getStart = function() {
  // Convert to strings with decimals to work around a bug in the Live API,
  // otherwise we get an invalid syntax error when trying to set notes
  if (this.start <= 0) return "0.0";
  return this.start.toFixed(4);
};

Note.prototype.getDuration = function() {
  if (this.duration <= Note.MIN_DURATION) return Note.MIN_DURATION;
  return this.duration.toFixed(4); // workaround similar bug as with getStart()
};

Note.prototype.getVelocity = function() {
  if (this.velocity < 0) return 0;
  if (this.velocity > 127) return 127;
  return this.velocity;
};

Note.prototype.getMuted = function() {
  if (this.muted) return 1;
  return 0;
};

//--------------------------------------------------------------------------------------
// State and helper functions

var selectedClip;
var clipLength;
var origNotes;
var newNotes;
var avg;
var rand1 = [];
var rand2 = [];
var needsReset = true;
var LOG4 = Math.log(4);
var multipliers = {
  velocity: {
    average: 64,
    random: 32,
  },
  start: {
    random: 1/3,
  },
  duration: {
    random: 1,
  },
};

function _reset(property) {
  if (!needsReset) return;
  selectedClip = selectedClip || new Clip("live_set view detail_clip");
  if (!selectedClip.exists()) return;

  if (!clipLength) {
    clipLength = selectedClip.getLength();
    multipliers.start.average = clipLength/2;
    multipliers.duration.average = clipLength/2;
  }

  origNotes = selectedClip.getSelectedNotes();
  var len = origNotes.length;
  if (len === 0) {
    selectedClip.selectAllNotes();
    origNotes = selectedClip.getSelectedNotes();
    len = origNotes.length;
  }
  newNotes = selectedClip.getSelectedNotes(); // lazy clone

  var i, total = 0;
  for (i = 0; i < len; i++) {
    total += origNotes[i][property];
    rand1[i] = 2 * Math.random() - 1;
    rand2[i] = 2 * Math.random() - 1;
  }
  avg = total / len;

  var diff;
  var sqrDiffTotal = 0;
  for (i = 0; i < len; i++) {
    diff = (origNotes[i][property] - avg);
    sqrDiffTotal += diff * diff;
  }
  var stdDev = Math.sqrt(sqrDiffTotal / len);
  multipliers[property].spread = multipliers[property].average/2/stdDev;

  needsReset = false;
}

//--------------------------------------------------------------------------------------
// Interface for Max patch

/**
 * Reset note data and generate new random seeds.
 * Use this when:
 * - the clip's notes change
 * - the user is done using a MIDI Clip Variator control to modify the clip
 * - the clip's note selection changes
 */
function bang() {
  needsReset = true;
}

/**
 * Reset the clip. Use this when the selected clip changes in Live
 */
function changeclip() {
  selectedClip = null;
  clipLength = null;
  needsReset = true;
}

function changelength() {
  clipLength = null;
  needsReset = true;
}

/**
 Shift all notes' property values by the same amount.
 - property is velocity, start, duration
 - amount should be from -1.0 to 1.0
 */
function average(property, amount) {
  _reset(property);
  if (!selectedClip.exists()) return;

  amount *= multipliers[property].average;
  for (var i = 0, len = origNotes.length; i < len; i++) {
    newNotes[i][property] = origNotes[i][property] + amount;
  }
  selectedClip.replaceSelectedNotes(newNotes);
}

/**
 Spread the notes' property values towards or away from the average value.
 - property is velocity, start, duration
 - amount should be from -1.0 to 1.0
 */
function spread(property, amount) {
  _reset(property);
  if (!selectedClip.exists()) return;

  amount *= multipliers[property].spread;
  for (var i = 0, len = origNotes.length; i < len; i++) {
    var val = origNotes[i][property];
    newNotes[i][property] = val + (val - avg) * amount;
  }
  selectedClip.replaceSelectedNotes(newNotes);
}

/**
 2-D randomization for the notes' property value.
 - property is velocity, start, duration
 - amount1 and amount2 should be from -1.0 to 1.0

 The randomization behavior is consistent until the next bang/reset, in other words:
 random('velocity', 0.5, -0.25) will always have the same effect until the next reset
 */
function random(property, amount1, amount2) {
  _reset(property);
  if (!selectedClip.exists()) return;

  var multiplier = multipliers[property].random;
  amount1 *= multiplier;
  amount2 *= multiplier;
  for (var i = 0, len = origNotes.length; i < len; i++) {
    newNotes[i][property] = origNotes[i][property] + (rand1[i] * amount1) + (rand2[i] * amount2);
  }
  selectedClip.replaceSelectedNotes(newNotes);
}
