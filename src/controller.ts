import AppView from './app-view'
import Clip from './clip'
import Note from './note'
import Transformer from './transformers/transformer'
import Slider, { SlidableProperty, EdgeTransformationType, SpreadAnchorType } from './transformers/slide-transformer'
// import { log } from './logger'

export { SlidableProperty }

export default class Controller {
  private isSynced = false
  private appView?: AppView
  private selectedClip?: Clip
  private slider = new Slider()

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

    for (const transformer of this.transformers) {
      transformer.notes = selectedNotes
    }
  
    this.isSynced = true
    return true
  }

  private get transformers(): Transformer[] {
    return [this.slider];
  }

  private transformNotes(transform: (clip: Clip) => Note[]) {
    if (!this.sync()) return
    if (!this.selectedClip) return
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
    this.slider.setRange(property, amount)
  }

  set slideEdgeBehavior(behavior: EdgeTransformationType) {
    this.slider.edgeBehavior = behavior
  }

  set spreadAnchor(anchor: SpreadAnchorType) {
    this.slider.spreadAnchor = anchor
  }

  randomSlide(property: SlidableProperty, amount1: number, amount2: number) {
    this.transformNotes((clip: Clip) => 
      this.slider.randomize2D(clip, property, amount1, amount2))
  }

  shift(property: SlidableProperty, amount: number) {
    this.transformNotes((clip: Clip) => 
      this.slider.shift(clip, property, amount))    
  }
  
  spread(property: SlidableProperty, amount: number) {
    this.transformNotes((clip: Clip) => 
      this.slider.spread(clip, property, amount))    
  }
};
