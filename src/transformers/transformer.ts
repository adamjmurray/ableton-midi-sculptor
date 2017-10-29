import Note from '../note'

export default abstract class Transformer {

  private _oldNotes: ReadonlyArray<Note> = [] // Don't change this
  protected newNotes: Note[] = [] // Modify this in place (to avoid constantly creating new objects while dragging a slider/x-y pad)
  protected randoms: number[][] = [[1], [2], [3], [4], [5], [6], [7], [8]] // x and y random values for each quadrant
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
      this.bipolarRandom1[index] = 2 * Math.random() - 1
      this.bipolarRandom2[index] = 2 * Math.random() - 1
    })
  }

  protected get oldNotes(): ReadonlyArray<Note> {
    return this._oldNotes
  }
}
