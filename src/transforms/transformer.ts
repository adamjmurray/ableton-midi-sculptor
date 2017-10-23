import Note from '../note'

export default abstract class Transformer {
  protected _notes: Note[] = []
  abstract set notes(notes: Note[])
}
