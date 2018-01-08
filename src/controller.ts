import AppView from './app-view'
import Clip from './clip'
import Note from './note'
import Transformer from './transformers/transformer'
import SlideTransformer, { SlidableProperty, EdgeTransformationType, SpreadAnchorType } from './transformers/slide-transformer'
import SetTransformer, { SettableProperty, SettableValue, ValueOperation } from './transformers/set-transformer'
import SwapTransformer, { SwappableProperty, GroupType, ExtraGroupType } from './transformers/swap-transformer'
import SplitTransformer, { SplitType, SplitEnvelopeType } from './transformers/split-transformer'
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
  private splitTransformer = new SplitTransformer()

  private get transformers(): Transformer[] {
    return [this.slideTransformer, this.setTransformer, this.swapTransformer, this.splitTransformer]
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
      transformer.clip = selectedClip
      transformer.notes = selectedNotes
    }

    this.isSynced = true
    return true
  }

  private transformNotes(transform: () => Note[]) {
    if (!this.sync()) return
    if (!this.selectedClip) return
    if (!this.selectedNotes.length) return
    const notes = transform()
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
    // This can get called a lot, so we defer the actual syncing until the next operation is performed
    this.isSynced = false
    if (this.selectedClip) this.selectedClip.desync()
  }

  onClipChange() {
    this.selectedClip = undefined
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

  randomSlide(property: SlidableProperty, amountX: number, amountY: number) {
    this.transformNotes(() =>
      this.slideTransformer.randomize2D(property, amountX, amountY))
  }

  shift(property: SlidableProperty, amount: number) {
    this.transformNotes(() =>
      this.slideTransformer.shift(property, amount))
  }

  spread(property: SlidableProperty, amount: number) {
    this.transformNotes(() =>
      this.slideTransformer.spread(property, amount))
  }

  swapTarget(target: SwappableProperty) {
    this.swapTransformer.target = target
  }

  swapGroupBy(type: GroupType, size?: number, param?: ExtraGroupType | number) {
    this.swapTransformer.groupBy(type, size, param)
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

  randomSwap(amountX: number, amountY: number) {
    this.transformNotes(() =>
      this.swapTransformer.randomize2D(amountX, amountY))
  }

  setProperty(property: SettableProperty) {
    this.setTransformer.property = property
  }

  setValue(value: SettableValue) {
    this.setTransformer.value = value
  }

  setValue2(value?: SettableValue) {
    this.setTransformer.value2 = value
  }

  setOperation(operation?: ValueOperation) {
    this.setTransformer.operation = operation
  }

  setAll() {
    this.transformNotes(() =>
      this.setTransformer.setAll())
  }

  randomSetValues(amountX: number, amountY: number) {
    this.transformNotes(() =>
      this.setTransformer.randomize2D(amountX, amountY))
  }

  setSplitType(type: SplitType, amount1: number, amount2: number) {
    this.splitTransformer.setSplitType(type, amount1, amount2)
  }

  set splitGate(amount: number) {
    this.splitTransformer.gate = amount
  }

  splitEnvelope(type: SplitEnvelopeType) {
    this.splitTransformer.envelope = type
  }

  split() {
    this.transformNotes(() =>
      this.splitTransformer.split())
  }
}
