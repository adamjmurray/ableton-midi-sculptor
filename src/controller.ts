import AppView from './app-view'
import Clip from './clip'
import Note from './note'
import Transformer from './transformers/transformer'
import SlideTransformer, { SlidableProperty, EdgeTransformationType, SpreadAnchorType } from './transformers/slide-transformer'
import SetTransformer, { SettableProperty } from './transformers/set-transformer'
import SwapTransformer, { SwappableProperty, GroupType, ExtraGroupType } from './transformers/swap-transformer'
import ChopTransformer, { ChopType, ChopEnvelopeType } from './transformers/chop-transformer'
// import { log } from './logger'

export { SlidableProperty }

export default class Controller {
  private isSynced = false
  private appView?: AppView
  private selectedClip?: Clip
  private selectedNotes: Note[] = []
  private slideTransformer = new SlideTransformer()
  private setTransformer = new SetTransformer()
  private swapTransformer = new SwapTransformer
  private chopTransformer = new ChopTransformer()

  private get transformers(): Transformer[] {
    return [this.slideTransformer, this.setTransformer, this.swapTransformer, this.chopTransformer]
  }

  private sync() {
    if (this.isSynced) return true
    const selectedClip = this.selectedClip = (this.selectedClip || new Clip(Clip.SELECTED_CLIP_PATH))
    if (!selectedClip.isMidi) return false

    this.appView = this.appView || new AppView()
    this.appView.showClipDetailView()

    let selectedNotes = selectedClip.selectedNotes
    if (selectedNotes.length === 0) {
      selectedNotes = selectedClip.selectAllNotes()
    }
    this.selectedNotes = selectedNotes
    for (const transformer of this.transformers) {
      transformer.notes = selectedNotes
    }

    this.isSynced = true
    return true
  }

  private transformNotes(transform: (clip: Clip) => Note[]) {
    if (!this.sync()) return
    if (!this.selectedClip) return
    if (!this.selectedNotes.length) return
    const notes = transform(this.selectedClip)
    this.selectedClip.replaceSelectedNotes(notes)
  }

  /**
   * Reset note data and generate new random seeds.
   * Use this when:
   * - the clip's notes change
   * - the user is done using a MIDI Clip Variator control to modify the clip
   * - the clip's note selection changes
   */
  desync() {
    // This can get called a lot, so we defer the actual syncing until the next operation is performaed
    this.isSynced = false
    if (this.selectedClip) this.selectedClip.desync()
  }

  /**
   Set maximum change in value for the given property.
   The range value for each property applies to its average, spread, and random operations.
   - property is velocity, start, duration
   - amount is from 0 to 127 for velocity, or a positive number in beats for start/duration
   */
  setSlideRange(property: SlidableProperty, amount: number) {
    this.slideTransformer.setRange(property, amount)
  }

  set slideEdgeBehavior(behavior: EdgeTransformationType) {
    this.slideTransformer.edgeBehavior = behavior
  }

  set spreadAnchor(anchor: SpreadAnchorType) {
    this.slideTransformer.spreadAnchor = anchor
  }

  randomSlide(property: SlidableProperty, amount1: number, amount2: number) {
    this.transformNotes((clip: Clip) =>
      this.slideTransformer.randomize2D(clip, property, amount1, amount2))
  }

  shift(property: SlidableProperty, amount: number) {
    this.transformNotes((clip: Clip) =>
      this.slideTransformer.shift(clip, property, amount))
  }

  spread(property: SlidableProperty, amount: number) {
    this.transformNotes((clip: Clip) =>
      this.slideTransformer.spread(clip, property, amount))
  }

  toggleSwapProperty(property: SwappableProperty, enabled: boolean) {
    this.swapTransformer.toggleProperty(property, enabled)
  }

  swapGroupBy(type: GroupType, size?: number, extraGroupType?: ExtraGroupType) {
    this.swapTransformer.groupBy(type, size, extraGroupType)
  }

  rotate(amount: number) {
    this.transformNotes(() =>
      this.swapTransformer.rotate(amount))
  }

  swapPairs() {
    this.transformNotes(() =>
      this.swapTransformer.swapPairs())
  }

  reverse() {
    this.transformNotes(() =>
      this.swapTransformer.reverse())
  }

  zip() {
    this.transformNotes(() =>
      this.swapTransformer.zip())
  }

  unzip() {
    this.transformNotes(() =>
      this.swapTransformer.unzip())
  }

  randomSwap(amount1: number, amount2: number) {
    this.transformNotes(() =>
      this.swapTransformer.randomize2D(amount1, amount2))
  }

  setValues(property: SettableProperty, value: number) {
    this.transformNotes(() =>
      this.setTransformer.setValues(property, value))
  }

  randomSetValues(property: SettableProperty, value: number, amount1: number, amount2: number) {
    this.transformNotes(() =>
      this.setTransformer.randomize2D(property, value, amount1, amount2))
  }

  setChopType(type: ChopType, amount1: number, amount2: number) {
    this.chopTransformer.setChopType(type, amount1, amount2)
  }

  set chopGate(amount: number) {
    this.chopTransformer.gate = amount
  }

  chopEnvelope(type: ChopEnvelopeType) {
    this.chopTransformer.envelope = type
  }

  chop() {
    this.transformNotes(() =>
      this.chopTransformer.chop())
  }
}
