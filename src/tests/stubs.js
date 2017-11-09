if (typeof post === 'undefined') {
  post = console.log // Fallback when testing in Node.js
}
if (typeof LiveAPI === 'undefined') {
  LiveAPI = function LiveAPI(path) { this.path = path }
  LiveAPI.prototype.get = function(property) { return false }
  LiveAPI.prototype.call = function() { return false }
}
