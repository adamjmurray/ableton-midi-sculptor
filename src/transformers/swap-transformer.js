import Transformer from './transformer';
import { mod } from '../utils';

export default class SwapTransformer extends Transformer {
  constructor() {
    super();
    this.targets = ['pitch', 'velocity', 'duration'];
  }

  set notes(notes) {
    super.setNotes(notes);
  }

  target(target, enabled) {
    const {
      targets
    } = this;
    const index = targets.indexOf(target);

    if (enabled) {
      if (index < 0) {
        targets.push(target);
      }
    } else {
      if (index >= 0) {
        targets.splice(index, 1);
      }
    }
  }

  swap(mapIndex) {
    const {
      newNotes,
      oldNotes,
      targets
    } = this;
    return newNotes.map((note, index) => {
      const mappedIndex = mapIndex(index, newNotes.length);
      const mappedNote = oldNotes[mappedIndex] || oldNotes[index];
      targets.forEach(prop => note.set(prop, mappedNote.get(prop)));
      return note;
    });
  } // TODO: now I need to adjust each algorithm below to respect groupings. I feel like it can be done generically...
  // We need to subdivide the notes up and run the algorithm on each group separately
  // So each of these functions needs to be refactored into a function (callback?) that takes a list of notes
  // and modifies them in place. We'll split newNotes and oldNotes based on the group settings


  rotate(amount) {
    amount = Math.round(amount * this.oldNotes.length);
    return this.swap((index, size) => mod(index - amount, size));
  }

  swapPairs() {
    return this.swap(index => index % 2 == 0 ? index + 1 : index - 1);
  }

  reverse() {
    return this.swap((index, size) => size - index - 1);
  }
  /**
   * Divide the note list into 2 halves and then interleave the halves together (like a zipper)
   */


  zip() {
    return this.swap((index, size) => {
      const middle = Math.floor(size / 2); // if (size % 2 === 1 && index === size - 1) return index // last element in an odd-length array, leave it alone

      return index < middle ? 2 * index + 1 : (index - middle) * 2;
    });
  }

  unzip() {
    return this.swap((index, size) => {
      const middle = Math.floor(size / 2); // if (size % 2 === 1 && index === size - 1) return index // last element in an odd-length array, leave it alone

      return index % 2 === 0 ? middle + index / 2 : (index - 1) / 2;
    });
  }

  randomize2D(amountX, amountY) {
    const swappedNotes = this.swap((index, size) => {
      if (this.isInRandomBounds(amountX, amountY, index)) {
        // it might be better if there were a different random for each quadrant
        // and we want a random shuffling of the order that
        const random = Math.abs(amountX > 0 ? this.bipolarRandom1[index] : this.bipolarRandom2[index]);
        return Math.floor(random * size);
      } else {
        return index;
      }
    });
    return swappedNotes;
  }

}