let properties = {};
let functions = {};

export class MockLiveAPI {
  constructor(path) {
    this.path = path;
  }

  static reset() {
    properties = {};
    functions = {};
  }

  static mockProperty(name, value) {
    properties[name] = value;
  }

  static mockCall(name, fn) {
    functions[name] = fn;
  }

  get(name) {
    return properties[name];
  }

  call(name, ...args) {
    const fn = functions[name];
    return fn && fn.apply(null, args);
  }
}
