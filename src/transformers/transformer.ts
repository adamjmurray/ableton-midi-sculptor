import Note from '../note'
import Clip from '../clip'

export default abstract class Transformer {

  public clip?: Clip

  private _oldNotes: ReadonlyArray<Note> = [] // Don't change this
  protected newNotes: Note[] = [] // Modify this in place (to avoid constantly creating new objects while dragging a slider/x-y pad)
  protected randoms: number[][] = [[1], [2], [3], [4], [5], [6], [7], [8]] // x and y random values for each quadrant
  protected unipolarRandom: number[] = []
  protected bipolarRandom1: number[] = []
  protected bipolarRandom2: number[] = []

  // Override this setter in the subclass, and call super.setNotes(notes) to trigger the common behavior.
  // We use super.setNotes(notes) because you (currently) can't call super.notes = notes from a child class when you override the setter.
  abstract set notes(notes: Note[])

  protected setNotes(notes: Note[]): void {
    this._oldNotes = Object.freeze(notes)
    this.newNotes = notes.map(note => note.clone())
    notes.forEach((_, index) => {
      for (const random of this.randoms) {
        // use exponential curves for better usability, so you can see an effect with less mouse movement:
        random[index] = Math.pow(Math.random(), 2)
      }
      this.unipolarRandom[index] = Math.random()
      this.bipolarRandom1[index] = 2 * Math.random() - 1
      this.bipolarRandom2[index] = 2 * Math.random() - 1
    })
  }

  protected get oldNotes(): ReadonlyArray<Note> {
    return this._oldNotes
  }

  /**
   * With the 8 random numbers (from 0 to 1), use one pair for each quadrant in the (-1,-1) to (1,1) cartesian coordinate space
   * From the 2 given (x,y) (which should be from -1 to 1), return true if amount x,y exceeds the random x,y for that quadrant.
   * This algorithm is suitable for determining when an on/off operation (such as set or swap) should occur from the x-y pad input
   */
  protected isInRandomBounds(x: number, y: number, noteIndex: number) {
    if (x > 0) {
      if (y > 0) {
        return x >= this.randoms[0][noteIndex] && y >= this.randoms[1][noteIndex]
      } else {
        return x >= this.randoms[2][noteIndex] && -y >= this.randoms[3][noteIndex]
      }
    } else {
      if (y > 0) {
        return -x >= this.randoms[4][noteIndex] && y >= this.randoms[5][noteIndex]
      } else {
        return -x >= this.randoms[6][noteIndex] && -y >= this.randoms[7][noteIndex]
      }
    }
  }
}
