import Transformer from './transformer'
import Note, { NumericProperty} from '../note'
import { mod } from '../utils'
import { log } from '../logger'

export type SwappableProperty = 'notes' | 'groups' | 'pitch' | 'velocity' | 'duration' | 'pitch + velocity' | 'pitch + duration' | 'velocity + duration'
export type GroupType = 'all' | 'notes' | 'time'
export type ExtraGroupType = 'first' | 'last' | 'any' | 'new'

export default class SwapTransformer extends Transformer {

  private _target: SwappableProperty = 'notes'
  private groupType: GroupType = 'all'
  private groupSize? = 2
  private extraGroupType?: ExtraGroupType = 'new'

  set notes(notes: Note[]) {
    super.setNotes(notes)
  }

  set target(target: SwappableProperty) {
    this._target = target
  }

  groupBy(type: GroupType, size?: number, extraGroupType?: ExtraGroupType) {
    this.groupType = type
    this.groupSize = size
    this.extraGroupType = extraGroupType
  }

  private get groupedIndexes(): number[][] {
    // TODO: cache this until the next set notes
    const notes = this.oldNotes
    const groups: number[][] = []
    const groupSize = this.groupSize
    if (groupSize != null && groupSize > 0) {

      if (this.groupType === 'notes') {
        for (let startIndex = 0; startIndex < notes.length; startIndex += groupSize) {
          const group = []
          const actualSize = Math.min(groupSize, notes.length - startIndex)
          for (let noteIndex = startIndex; noteIndex < startIndex + actualSize; noteIndex++) {
            group.push(noteIndex)
          }
          if (groups.length === 0 || actualSize === groupSize) { // first group or "normal" group
            groups.push(group)
          }
          else { // it's the extra group
            switch(this.extraGroupType) {
              case 'first':
                groups[0] = groups[0].concat(group)
                break
              case 'last':
                groups[groups.length-1] = groups[groups.length-1].concat(group)
                break
              case 'any':
                const randomIndex = Math.floor(this.randoms[0][0] * groups.length)
                groups[randomIndex] = groups[randomIndex].concat(group)
                break
              default: // 'new' or invalid setting
                groups.push(group)
            }
          }
        }
        return groups
      }

      else if (this.groupType === 'time') {
        notes.forEach((note, noteIndex) => {
          const groupIndex = Math.floor(note.start / groupSize)
          if (!groups[groupIndex]) groups[groupIndex] = []
          groups[groupIndex].push(noteIndex)
        })
        return groups
        // Not doing this anymore because group-swapping can swap a group into an empty group's position
        // return groups.filter(group => group) // get rid of any gaps
      }

    }
    return [notes.map((_,index) => index)] // fallback to one group containing all indexes
  }

  private get targetProperties(): NumericProperty[] {
    switch (this._target) {
      case 'notes': return ['pitch', 'velocity', 'duration']
      case 'pitch': return ['pitch']
      case 'velocity': return ['velocity']
      case 'duration': return ['duration']
      case 'pitch + velocity': return ['pitch', 'velocity']
      case 'pitch + duration': return ['pitch', 'duration']
      case 'velocity + duration': return ['velocity', 'duration']
      default: return []
    }
  }

  private transformGroups(mapGroupPosition: (position: number, groupSize: number, index: number) => number): Note[] {
    const { newNotes, oldNotes } = this
    const groupedIndexes = this.groupedIndexes
    // TODO: need special handling for swapping groups
    if (this._target === 'groups') {
      if (groupedIndexes.length > 1) { // otherwise there is nothing to swap
        groupedIndexes.forEach((group, position) => {
          const mappedPosition = mapGroupPosition(position, groupedIndexes.length, position)
          const mappedGroup = groupedIndexes[mappedPosition] || group
          // TODO: now swap the group. If the group type is 'note' then swap relative times from the first note of each group
          // If the group type is time, then swap group start times
          // TODO: we need to make sure it works repeatedly with random (see how we default the mappedNote to the oldNotes[noteIndex] below)
          if (this.groupType === 'notes') {
            if (!group.length || !mappedGroup.length) return
            const start = oldNotes[group[0]].start
            const mappedStart = oldNotes[mappedGroup[0]].start
            log({ group, mappedGroup, start, mappedStart })
            for (const noteIndex of group) {
              const note = newNotes[noteIndex]
              const relativeStart = note.start - start
              note.start = mappedStart + relativeStart
            }
            for (const noteIndex of mappedGroup) {
              const note = newNotes[noteIndex]
              const relativeStart = note.start - mappedStart
              note.start = start + relativeStart
            }
          } else if (this.groupType === 'time') {

          }
        })
      }
    } else { // swap the choosen properties between notes within each group
      for (const group of groupedIndexes) {
        group.forEach((noteIndex, position) => {
          const note = newNotes[noteIndex]
          const mappedPosition = mapGroupPosition(position, group.length, noteIndex)
          const mappedNote = oldNotes[group[mappedPosition]] || oldNotes[noteIndex]
          this.targetProperties.forEach(property => note.set(property, mappedNote.get(property)))
        })
      }
    }
    return this.newNotes
  }

  // TODO: now I need to adjust each algorithm below to respect groupings. I feel like it can be done generically...
  // We need to subdivide the notes up and run the algorithm on each group separately
  // So each of these functions needs to be refactored into a function (callback?) that takes a list of notes
  // and modifies them in place. We'll split newNotes and oldNotes based on the group settings

  rotate(amount: number): Note[] {
    amount = Math.round(amount * this.oldNotes.length) // Hmm, not sure about this when using groups. Need to test the UX
    return this.transformGroups((position, groupSize) => mod(position + amount, groupSize))
  }

  swapPairs(): Note[] {
    return this.transformGroups(position => (position % 2 == 0) ? (position + 1) : (position - 1))
  }

  reverse(): Note[] {
    return this.transformGroups((position, groupSize) => groupSize - position - 1)
  }

  /**
   * Divide the note list into 2 halves and then interleave the halves together (like a zipper)
   */
  zip(): Note[] {
    return this.transformGroups((position, groupSize) => {
      const middlePosition = Math.floor(groupSize / 2)
      if (groupSize % 2 === 1 && position === groupSize - 1) return position // last element in an odd-length array, leave it alone
      return (position < middlePosition) ? (2 * position + 1) : (position - middlePosition) * 2
    })
  }

  // TODO?
  unzip(): Note[] {
    return this.transformGroups((position, groupSize) => {
      const middlePosition = Math.floor(groupSize / 2)
      if (groupSize % 2 === 1 && position === groupSize - 1) return position // last element in an odd-length array, leave it alone
      return (position % 2 === 0) ? (middlePosition + position / 2) : (position - 1) / 2
    })
  }

  randomize2D(amountX: number, amountY: number): Note[] {
    return this.transformGroups((position, groupSize, index) => {
      if (this.isInRandomBounds(amountX, amountY, index)) {
        const random = Math.abs(amountX > 0 ? this.bipolarRandom1[index] : this.bipolarRandom2[index])
        return Math.floor(random * groupSize)
      } else {
        return position
      }
    })
  }
}
