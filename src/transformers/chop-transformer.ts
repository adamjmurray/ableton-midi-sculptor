import Transformer from './transformer'
import Note from '../note'
// import { log } from '../logger'

export enum ChopType {
  TIME = 'time',
  NUMBER = 'number',
  EUCLID = 'euclid'
   // TODO: maybe  | 'exponential', halves the duration after `amount` times
}

export enum ChopEnvelopeType {
  NONE = 'none',
  RAMP_UP = 'ramp-up',
  RAMP_DOWN = 'ramp-down',
  CURVE_UP = 'curve-up',
  CURVE_DOWN = 'curve-down',
}

export default class ChopTransformer extends Transformer {

  private chopType = ChopType.TIME
  private time = 1
  private number = 1
  private euclid = [1, 1] // [pulses, total]
  private _gate = 1
  private _envelope = ChopEnvelopeType.NONE

  set notes(notes: Note[]) {
    super.setNotes(notes)
  }

  setChopType(type: ChopType, amount1: number = 1, amount2: number = 1) {
    this.chopType = type
    if (type === ChopType.TIME) {
      this.time = amount1
    } else if (type === ChopType.NUMBER) {
      this.number = amount1
    } else if (type === ChopType.EUCLID) {
      this.euclid = [amount1, amount2]
    }
  }

  set gate(gate: number) {
    this._gate = gate
  }

  set envelope(envelope: ChopEnvelopeType) {
    this._envelope = envelope
  }

  chop() {
    const notes: Note[] = []
    const { oldNotes, chopType, time, number, _gate: gate } = this
    for (const oldNote of oldNotes) {
      if (chopType === ChopType.TIME) {
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
      else if (chopType === ChopType.NUMBER) {
        const timeBetweenNotes = oldNote.duration / number
        const duration = gate * timeBetweenNotes
        for(let i = 0; i < number; i++) {
          const note = oldNote.clone()
          note.start = oldNote.start + timeBetweenNotes * i
          note.duration = duration
          notes.push(note)
        }
      }
      else if (chopType === ChopType.EUCLID) {
        const [pulses, total] = this.euclid
        const segmentDuration = oldNote.duration / total
        let note = oldNote.clone()
        let numSegments = 0
        let pulseCount = 0
        let nextPulse = Math.floor(++pulseCount/pulses * total)
        for (let i=0; i<=total; i++) {
          if (i < nextPulse) {
            numSegments++
          } else { // end of pulse
            note.duration = numSegments * segmentDuration
            notes.push(note)
            note = oldNote.clone()
            note.start = i * segmentDuration
            nextPulse = Math.floor(++pulseCount/pulses * total)
          }
        }
      }
    }
    return notes
  }
}
