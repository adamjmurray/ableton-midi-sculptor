if (typeof post === 'undefined') {
  post = console.log // Fallback when testing in Node.js
}

let getHandler
let callHandlers = {}

if (typeof LiveAPI === 'undefined') {
  LiveAPI = class LiveAPI {
    static handleGet(handler) { getHandler = handler }
    static handleCall(functionName, handler) { callHandlers[functionName] = handler }
    constructor(path) { this.patch = path }
    get(property) { return getHandler && getHandler(property) }
    call(method) { return callHandlers[method] && callHandlers[method].apply(null, Array.prototype.slice.call(arguments)) }
  }
}

beforeEach(() => {
  getHandler = null
  callHandler = {}
})

import './clip-test'
import './slide-transformer-test'
import './swap-transformer-test'
import './utils-test'
