const APP_VIEW_PATH = 'live_app view'

export default class AppView {

  private readonly api: LiveAPI

  constructor() {
    this.api = new LiveAPI(APP_VIEW_PATH)
  }

  showClipDetailView() {
    this.api.call('show_view', 'Detail/Clip')
  }
}
