import Transformer from "./Transformer";
import Clip from "../Clip";

const truncated = (notes) => {
  console.log(`Reached maximum of ${Clip.MAX_NOTES} notes. Some notes were not created.`);
  return notes;
};

const splitInTime = (oldNote, timeBetweenNotes, maxNotes) => {
  const notes = [];
  for (let t = 0; t < oldNote.duration; t += timeBetweenNotes) {
    if (notes.length >= maxNotes) return truncated(notes);
    const note = oldNote.clone();
    note.start = oldNote.start + t;

    if (t + timeBetweenNotes >= oldNote.duration) {
      // last note, don't go beyond the existing end of the note:
      note.duration = oldNote.duration - t;
    } else {
      note.duration = timeBetweenNotes;
    }

    notes.push(note);
  }
  return notes;
};

const splitInto = (oldNote, numberOfNotes, maxNotes) => {
  const notes = [];
  const duration = oldNote.duration / numberOfNotes;

  for (let i = 0; i < numberOfNotes; i++) {
    if (notes.length >= maxNotes) return truncated(notes);
    const note = oldNote.clone();
    note.start = i * duration;
    note.duration = duration;
    notes.push(note);
  }

  return notes;
};

const splitEuclid = (oldNote, pulses, total, maxNotes) => {
  const notes = [];
  const segmentDuration = oldNote.duration / total;
  let note = oldNote.clone();
  let numSegments = 0; // To get the longest segment first, we have to run this loop in reverse

  let pulseCount = pulses;
  let nextPulse = Math.floor((--pulseCount / pulses) * total);

  for (let i = total; i >= 0; i--) {
    if (notes.length >= maxNotes) return truncated(notes);

    if (i > nextPulse) {
      numSegments++;
    } else {
      // end of pulse
      note.duration = numSegments * segmentDuration;
      notes.push(note);
      note = oldNote.clone();
      note.start = note.start + (total - i) * segmentDuration;
      numSegments = 1;
      pulseCount--;
      nextPulse = Math.floor((pulseCount / pulses) * total);
    }
  }

  return notes;
};

const splitHalves = (oldNote, notesPerDivision, divisions, maxNotes) => {
  const notes = [];
  const reversed = divisions < 0;
  let start = oldNote.start + (reversed ? oldNote.duration : 0);
  divisions = Math.abs(divisions);

  for (let d = 0; d < divisions; d++) {
    let divisionDuration = oldNote.duration / Math.pow(2, d + 1);
    let numNotes = notesPerDivision;

    if (d === divisions - 1) {
      // last division has to double the time and number of notes to fill up the original duration
      divisionDuration *= 2;
      numNotes *= 2;
    }

    const duration = divisionDuration / numNotes;
    if (reversed) start -= divisionDuration;

    for (let n = 0; n < numNotes; n++) {
      if (notes.length >= maxNotes) return truncated(notes);
      const note = oldNote.clone();
      note.duration = duration;
      note.start = start + duration * n;
      notes.push(note);
    }

    if (!reversed) start += divisionDuration;
  }

  return notes;
};

const applyGateAndEnvelope = (notes, gate, envelope) => {
  const length = notes.length;
  if (!length) return;
  const deltaFromMax = 127 - notes[0].velocity;
  notes.forEach((note, index) => {
    note.duration *= gate;

    switch (envelope) {
      case "fade-out":
        note.velocity *= (length - index) / length;
        break;

      case "fade-in":
        note.velocity *= (index + 1) / length;
        break;

      case "ramp-down":
        note.velocity += (deltaFromMax * (length - index)) / length;
        break;

      case "ramp-up":
        note.velocity += (deltaFromMax * (index + 1)) / length;
    }
  });
};

export default class SplitTransformer extends Transformer {
  constructor() {
    super();
    this.previousSplitNotes = [];
    this.previousOldNotes = [];
    this.splitType = "note";
    this.time = 1;
    this.number = 2;
    this.euclid = [1, 1]; // [pulses, total]

    this.halves = [1, 4]; // [notesBeforeDivision, divisions]

    this.start = 0;
    this.end = 1;
    this.gate = 1;
    this.envelope = "none";
  }

  set notes(notes) {
    super.setNotes(notes);
    this.newNotes = []; // splitTilt() uses this to know if it needs to split
  }

  setSplitType(type, amount1, amount2 = 1) {
    this.splitType = type;

    if (type === "time") {
      this.time = amount1;
    } else if (type === "note") {
      this.number = amount1;
    } else if (type === "euclid") {
      this.euclid = [amount1, amount2];
    } else if (type === "halves") {
      this.halves = [amount1, amount2];
    }
  }

  isResplit() {
    const { oldNotes, previousSplitNotes } = this;
    return (
      oldNotes.length === previousSplitNotes.length &&
      !oldNotes.find((note, index) => !note.equals(previousSplitNotes[index], true))
    ); // can't find an unequal note (ignoring duration)
  }

  splitWith(splitter) {
    const { oldNotes, gate, envelope, previousOldNotes } = this; // Go back to original notes when splitting multiple times in a row (for usability)

    const notesToSplit = this.isResplit() ? previousOldNotes : oldNotes; // Consider only spitting the first note, or joining consecutive notes before splitting...

    let notes = [];
    let maxNotes = Clip.MAX_NOTES;

    for (const note of notesToSplit) {
      const splitNotes = splitter(note, maxNotes);
      applyGateAndEnvelope(splitNotes, gate, envelope);
      notes = notes.concat(splitNotes);
      if (notes.length >= Clip.MAX_NOTES) break;
      maxNotes = Clip.MAX_NOTES - notes.length;
    }

    this.previousOldNotes = notesToSplit;
    this.previousSplitNotes = notes;
    return notes;
  }

  split() {
    const {
      splitType,
      time,
      number,
      euclid: [pulses, total],
      halves: [notesBeforeDivision, divisions],
    } = this;

    switch (splitType) {
      case "time":
        return this.splitWith((note, maxNotes) => splitInTime(note, time, maxNotes));

      case "note":
        return this.splitWith((note, maxNotes) => splitInto(note, number, maxNotes));

      case "euclid":
        return this.splitWith((note, maxNotes) => splitEuclid(note, pulses, total, maxNotes));

      case "halves":
        return this.splitWith((note, maxNotes) => splitHalves(note, notesBeforeDivision, divisions, maxNotes));

      default:
        return this.oldNotes.map((note) => note.clone());
    }
  }

  splitTilt(amount) {
    if (!this.newNotes.length) {
      const notes = this.split().map((note) => note.clone());
      this.oldNotes = notes;
      this.newNotes = notes.map((note) => note.clone());
      this.previousSplitNotes = this.newNotes; // so isResplit() will still work after tilting

      this.start = Math.min(...notes.map((note) => note.start));
      this.end = Math.max(...notes.map((note) => note.start + note.duration));
    }

    const { oldNotes, newNotes, start, end } = this;
    if (amount === 0) return newNotes;
    let power;

    if (amount < 0) {
      power = 1 - amount * 2;
    } else {
      power = 1 / (1 + amount * 2);
    }

    const totalDuration = end - start;
    oldNotes.forEach((note, index) => {
      const normalizedStart = (note.start - start) / totalDuration;
      const mapped = Math.pow(normalizedStart, power);
      newNotes[index].start = mapped * totalDuration + start;
    });
    return newNotes;
  }
}
