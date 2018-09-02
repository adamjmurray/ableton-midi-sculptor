import AppView from './app-view';
import Clip, { SELECTED_CLIP_PATH } from './clip';
import SlideTransformer, { SlidableProperty } from './transformers/slide-transformer';
import SetTransformer from './transformers/set-transformer';
import SwapTransformer from './transformers/swap-transformer';
import SplitTransformer from './transformers/split-transformer'; // import { log } from './logger'

export { SlidableProperty };

export default class Controller {
  constructor() {
    this.isSynced = false;
    this.selectedNotes = [];
    this.slideTransformer = new SlideTransformer();
    this.setTransformer = new SetTransformer();
    this.swapTransformer = new SwapTransformer();
    this.splitTransformer = new SplitTransformer();
  }

  get transformers() {
    return [this.slideTransformer, this.setTransformer, this.swapTransformer, this.splitTransformer];
  }

  sync() {
    if (this.isSynced) return true;
    const selectedClip = this.selectedClip = this.selectedClip || new Clip(SELECTED_CLIP_PATH);
    if (!selectedClip.isMidi) return false;
    this.appView = this.appView || new AppView();
    this.appView.showClipDetailView();
    let selectedNotes = selectedClip.selectedNotes;

    if (selectedNotes.length === 0) {
      selectedNotes = selectedClip.selectAllNotes();
    }

    this.selectedNotes = selectedNotes;

    for (const transformer of this.transformers) {
      transformer.clip = selectedClip;
      transformer.notes = selectedNotes;
    }

    this.isSynced = true;
    return true;
  }

  transformNotes(transform) {
    if (!this.sync()) return;
    if (!this.selectedClip) return;
    if (!this.selectedNotes.length) return;
    const notes = transform();
    if (notes) this.selectedClip.replaceSelectedNotes(notes);
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
    this.isSynced = false;
    if (this.selectedClip) this.selectedClip.desync();
  }

  onClipChange() {
    this.selectedClip = undefined;
  }
  /**
   Set maximum change in value for the given property.
   The range value for each property applies to its average, spread, and random operations.
   - property is velocity, start, duration
   - amount is from 0 to 127 for velocity, or a positive number in beats for start/duration
   */


  setSlideRange(property, amount) {
    this.slideTransformer.setRange(property, amount);
  }

  set slideEdgeBehavior(behavior) {
    this.slideTransformer.edgeBehavior = behavior;
  }

  set spreadAnchor(anchor) {
    this.slideTransformer.spreadAnchor = anchor;
  }

  randomSlide(property, amountX, amountY) {
    this.transformNotes(() => this.slideTransformer.randomize2D(property, amountX, amountY));
  }

  shift(property, amount) {
    this.transformNotes(() => this.slideTransformer.shift(property, amount));
  }

  spread(property, amount) {
    this.transformNotes(() => this.slideTransformer.spread(property, amount));
  }

  swapTarget(target, enabled) {
    this.swapTransformer.target(target, enabled);
  }

  rotate(amount) {
    this.transformNotes(() => this.swapTransformer.rotate(amount));
  }

  swapPairs() {
    this.transformNotes(() => this.swapTransformer.swapPairs());
  }

  reverse() {
    this.transformNotes(() => this.swapTransformer.reverse());
  }

  zip() {
    this.transformNotes(() => this.swapTransformer.zip());
  }

  unzip() {
    this.transformNotes(() => this.swapTransformer.unzip());
  }

  randomSwap(amountX, amountY) {
    this.transformNotes(() => this.swapTransformer.randomize2D(amountX, amountY));
  }

  setProperty(property) {
    this.setTransformer.property = property;
  }

  setValue(value) {
    this.setTransformer.value = value;
  }

  setAll() {
    this.transformNotes(() => this.setTransformer.setAll());
  }

  randomSetValues(amountX, amountY) {
    this.transformNotes(() => this.setTransformer.randomize2D(amountX, amountY));
  }

  setSplitType(type, amount1, amount2) {
    this.splitTransformer.setSplitType(type, amount1, amount2);
  }

  set splitGate(amount) {
    this.splitTransformer.gate = amount;
    this.transformNotes(() => this.splitTransformer.isResplit() ? this.splitTransformer.split() : null);
  }

  set splitEnvelope(type) {
    this.splitTransformer.envelope = type;
  }

  split() {
    this.transformNotes(() => this.splitTransformer.split());
  }

  splitTilt(amount) {
    this.transformNotes(() => this.splitTransformer.splitTilt(amount));
  }

}