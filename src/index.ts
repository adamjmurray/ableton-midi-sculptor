import './polyfills'
import { log } from './logger' 
import Clip from './clip'
log("___________________________________________________");
log("Reload:", new Date);

const clip = new Clip();
log(clip.isMidi)
log(clip.selectedNotes)

/*
import Controller from './Controller'

const controller = new Controller()

function anything() {
  const action = controller[messagename]
  action ? action(...arguments) : error(`unknown action "${messagename}"`)
}
*/