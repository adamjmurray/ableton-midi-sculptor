import Transformer from './transformer'
import Note from '../note'
// import { log } from '../logger'

export type SplitType = 'time' | 'note' | 'euclid' // and maybe  | 'exponential', halves the duration after `amount` times
export type SplitEnvelopeType = 'none' | 'ramp-up' | 'ramp-down' | 'curve-up' | 'curve-down'

const splitInTime = (oldNote: Note, timeBetweenNotes: number): Note[] => {
  const notes: Note[] = []
  for (let t = 0; t < oldNote.duration; t += timeBetweenNotes) {
    const note = oldNote.clone()
    note.start = oldNote.start + t
    if (t + timeBetweenNotes >= oldNote.duration) { // last note, don't go beyond the existing end of the note:
      note.duration = oldNote.duration - t
    } else {
      note.duration = timeBetweenNotes
    }
    notes.push(note)
  }
  return notes
}

const splitEuclid = (oldNote: Note, pulses: number, total: number): Note[] => {
  const notes: Note[] = []
  const segmentDuration = oldNote.duration / total
  let note = oldNote.clone()
  let numSegments = 0
  // To get the longest segment first, we have to run this loop in reverse
  let pulseCount = pulses
  let nextPulse = Math.floor(--pulseCount / pulses * total)
  for (let i = total; i >= 0; i--) {
    if (i > nextPulse) {
      numSegments++
    } else { // end of pulse
      note.duration = numSegments * segmentDuration
      notes.push(note)
      note = oldNote.clone()
      note.start = note.start + (total - i) * segmentDuration
      numSegments = 1
      pulseCount--
      nextPulse = Math.floor(pulseCount / pulses * total)
    }
  }
  return notes
}

export default class SplitTransformer extends Transformer {

  private splitType = 'time'
  private time = 1
  private number = 1
  private euclid = [1, 1] // [pulses, total]
  gate = 1
  envelope = 'none'

  set notes(notes: Note[]) {
    super.setNotes(notes)
  }

  setSplitType(type: SplitType, amount1: number, amount2: number = 1) {
    this.splitType = type
    if (type === 'time') {
      this.time = amount1
    } else if (type === 'note') {
      this.number = amount1
    } else if (type === 'euclid') {
      this.euclid = [amount1, amount2]
    }
  }

  private splitWith(splitter: (note: Note) => Note[]) {
    const { oldNotes, gate } = this
    let notes: Note[] = []
    for (const oldNote of oldNotes) {
      notes = notes.concat(splitter(oldNote))
    }
    for (const note of notes) {
      note.duration *= gate
      // TODO: here's where to apply the envelope
    }
    return notes
  }

  split(): Note[] {
    const { splitType, time, number, euclid: [pulses, total] } = this
    switch (splitType) {
      case 'time': return this.splitWith(note => splitInTime(note, time))
      case 'note': return this.splitWith(note => splitInTime(note, (note.duration / number)))
      case 'euclid': return this.splitWith(note => splitEuclid(note, pulses, total))
      default: return this.newNotes
    }
  }
}
