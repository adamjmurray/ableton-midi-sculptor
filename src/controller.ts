import AppView from './app-view'
import Clip from './clip'
import Note from './note'
import Transformer from './transforms/transformer'
import Slider, { SlidableProperty } from './transforms/slider'

export { SlidableProperty }

export default class Controller {
  private isSynced = false
  private appView: AppView
  private selectedClip: Clip
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

  private transformNotes(transform: () => Note[]) {
    if (!this.sync()) return
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
    // This can get called a lot, so we defer the actual syncing until the next operation is performaed
    this.isSynced = false
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

  setSlideEdgeBehavior() {

  }

  setSpreadType() {

  }

  randomSlide(property: SlidableProperty, amount1: number, amount2: number) {
    this.transformNotes(() => 
      this.slider.randomize2D(property, amount1, amount2))
  }

  shift(property: SlidableProperty, amount: number) {
    this.transformNotes(() => 
      this.slider.shift(property, amount))    
  }
  
  spread(property: SlidableProperty, amount: number) {
    this.transformNotes(() => 
      this.slider.spread(property, amount))    
  }
};
