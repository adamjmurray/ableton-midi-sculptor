import AppView from "./AppView";
import Clip from "./Clip";
import SlideTransformer from "./transformers/SlideTransformer";
import SetTransformer from "./transformers/SetTransformer";
import SwapTransformer from "./transformers/SwapTransformer";
import SplitTransformer from "./transformers/SplitTransformer";

export default class Controller {
  constructor() {
    this.isSynced = false;
    this.selectedNotes = [];
    this.slideTransformer = new SlideTransformer();
    this.setTransformer = new SetTransformer();
    this.swapTransformer = new SwapTransformer();
    this.splitTransformer = new SplitTransformer();
    this.transformers = [this.slideTransformer, this.setTransformer, this.swapTransformer, this.splitTransformer];
  }

  /* This function does several things to prepare for transforming notes:
     - Get the selected clip. If no clip is selected or it's not a MIDI clip, fail to sync.
     - Show the detail view (MIDI note editor) for the selected clip.
     - Get the selected notes. If no notes are selected, select all the notes and use those.
     - Update all the transformers with the selected clip and notes. This is a relatively
       expensive operation so we only do it once per sync, for performance.
     - Cache the synced state until desync() is called, for performance.
  */
  sync() {
    if (this.isSynced) return true;

    const selectedClip = this.selectedClip ??= Clip.selectedClip;
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
    if (notes) {
      this.selectedClip.updateSelectedNotes(notes);
    }
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
    this.isSynced = false;
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

  setSlideEdgeBehavior(behavior) {
    this.slideTransformer.edgeBehavior = behavior.toLowerCase();
  }

  setSlideAnchor(anchor) {
    this.slideTransformer.spreadAnchor = anchor.toLowerCase();
  }

  slideRandomly(property, amountX, amountY) {
    this.transformNotes(() => this.slideTransformer.randomize2D(property, amountX, amountY));
  }

  slideShift(property, amount) {
    if (property === "strum") {
      // strum shares the UI slider with shift
      this.transformNotes(() => this.slideTransformer.strum("start", amount));
    } else {
      this.transformNotes(() => this.slideTransformer.shift(property, amount));
    }
  }

  setStrumTension(amount) {
    // the UI goes from -1 to 1 but we use this as an exponent going from 0.5 (sqrt) to 2 (squared)
    // where the midpoint (amount == 0) is an exponent of 1.
    if (amount < 0) {
      // -1..0 => 0.5..1
      this.slideTransformer.tension = amount / 2 + 1;
    } else {
      // 0..1 => 1..2
      this.slideTransformer.tension = amount + 1;
    }
  }

  setStrumUnlockEnd(unlocked) {
    this.slideTransformer.strumUnlockEnd = unlocked;
  }

  slideSpread(property, amount) {
    if (property === "strum") {
      // strum shares the UI slider with spread
      this.transformNotes(() => this.slideTransformer.strum("duration", amount));
    } else {
      this.transformNotes(() => this.slideTransformer.spread(property, amount));
    }
  }

  setSwapTarget(property, enabled) {
    this.swapTransformer.target(property.toLowerCase(), enabled);
  }

  swapRotate(amount) {
    this.transformNotes(() => this.swapTransformer.rotate(amount));
  }

  swapPairs() {
    this.transformNotes(() => this.swapTransformer.swapPairs());
  }

  swapReverse() {
    this.transformNotes(() => this.swapTransformer.reverse());
  }

  swapZip() {
    this.transformNotes(() => this.swapTransformer.zip());
  }

  swapUnzip() {
    this.transformNotes(() => this.swapTransformer.unzip());
  }

  swapRandomly(amountX, amountY) {
    this.transformNotes(() => this.swapTransformer.randomize2D(amountX, amountY));
  }

  setSettableProperty(property) {
    this.setTransformer.property = property.toLowerCase();
  }

  setSettableValue(value) {
    this.setTransformer.value = typeof value === "string" ? value.toLowerCase() : value;
  }

  setAll() {
    this.transformNotes(() => this.setTransformer.setAll());
  }

  setRandomly(amountX, amountY) {
    this.transformNotes(() => this.setTransformer.randomize2D(amountX, amountY));
  }

  setSplitType(type, amount1, amount2) {
    this.splitTransformer.setSplitType(type.toLowerCase(), amount1, amount2);
  }

  setSplitGate(amount) {
    this.splitTransformer.gate = amount;
    // TODO: Do we want this? It causes an error during init
    // this.transformNotes(() => (this.splitTransformer.isResplit() ? this.splitTransformer.split() : null));
  }

  setSplitEnvelope(type) {
    this.splitTransformer.envelope = type.toLowerCase();
  }

  split() {
    this.transformNotes(() => this.splitTransformer.split());
  }

  setSplitTilt(amount) {
    this.transformNotes(() => this.splitTransformer.splitTilt(amount));
  }
}
