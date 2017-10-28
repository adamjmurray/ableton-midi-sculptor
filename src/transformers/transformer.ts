import Note from '../note'

export default abstract class Transformer {
  abstract set notes(notes: Note[])
}
