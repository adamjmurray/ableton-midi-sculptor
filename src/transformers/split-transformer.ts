import Transformer from './transformer'
import Note from '../note'
// import { log } from '../logger'

export type SplitType = 'time' | 'note' | 'euclid' // and maybe  | 'exponential', halves the duration after `amount` times
export type SplitEnvelopeType = 'none' | 'ramp-up' | 'ramp-down' | 'curve-up' | 'curve-down'

export default class SplitTransformer extends Transformer {

  private splitType = 'time'
  private time = 1
  private number = 1
  private euclid = [1, 1] // [pulses, total]
  private _gate = 1
  private _envelope = 'none'

  set notes(notes: Note[]) {
    super.setNotes(notes)
  }

  setSplitType(type: SplitType, amount1: number = 1, amount2: number = 1) {
    this.splitType = type
    if (type === 'time') {
      this.time = amount1
    } else if (type === 'note') {
      this.number = amount1
    } else if (type === 'euclid') {
      this.euclid = [amount1, amount2]
    }
  }

  set gate(gate: number) {
    this._gate = gate
  }

  set envelope(envelope: SplitEnvelopeType) {
    this._envelope = envelope
  }

  split() {
    const notes: Note[] = []
    const { oldNotes, splitType, time, number, _gate: gate } = this
    for (const oldNote of oldNotes) {
      if (splitType === 'time') {
        const duration = gate * time
        for (let t = 0; t < oldNote.duration; t += time) {
          const note = oldNote.clone()
          note.start = oldNote.start + t
          if (t + time >= oldNote.duration) { // last note, don't go beyond the existin gend of the note:
            note.duration = oldNote.duration - note.start
          } else {
            note.duration = duration
          }
          notes.push(note)
        }
      }
      else if (splitType === 'note') {
        const timeBetweenNotes = oldNote.duration / number
        const duration = gate * timeBetweenNotes
        for(let i = 0; i < number; i++) {
          const note = oldNote.clone()
          note.start = oldNote.start + timeBetweenNotes * i
          note.duration = duration
          notes.push(note)
        }
      }
      else if (splitType ==='euclid') {
        const [pulses, total] = this.euclid
        const segmentDuration = oldNote.duration / total
        let note = oldNote.clone()
        let numSegments = 0
        // To get the longest segment first, we have to run this loop in reverse
        let pulseCount = pulses
        let nextPulse = Math.floor(--pulseCount/pulses * total)
        for (let i=total; i>=0; i--) {
          if (i > nextPulse) {
            numSegments++
          } else { // end of pulse
            note.duration = numSegments * segmentDuration * gate
            notes.push(note)
            note = oldNote.clone()
            note.start = note.start + (total - i) * segmentDuration
            numSegments = 1
            nextPulse = Math.floor(--pulseCount/pulses * total)
          }
        }
      }
    }
    return notes
  }

  // TODO: latest version of TS seems to be stricter so I added this here to shut it up for now
  applyEnvelope() {
    return this._envelope.length
  }
}
