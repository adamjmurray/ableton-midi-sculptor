const APP_VIEW_PATH = 'live_app view';
export default class AppView {
  constructor() {
    this.api = new LiveAPI(APP_VIEW_PATH);
  }

  showClipDetailView() {
    this.api.call('show_view', 'Detail/Clip');
  }

}