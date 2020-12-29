let functions = {};
let properties = {};
let calls = [];
let gets = [];
let id = "1";

export class MockLiveAPI {
  constructor(path) {
    this.path = path;
  }

  static reset() {
    functions = {};
    properties = {};
    calls = [];
    gets = [];
    id = "1";
  }

  static mockProperty(name, value) {
    properties[name] = value;
  }

  static mockCall(name, fn) {
    functions[name] = fn;
  }

  static set id(_id) {
    id = _id;
  }

  static get calls() {
    return calls;
  }

  static get gets() {
    return gets;
  }

  get id() {
    return id;
  }

  get(name) {
    gets.push(name);
    if (!properties.hasOwnProperty(name)) {
      throw new Error(`Unexpected LiveAPI get: ${name}`);
    }
    return properties[name];
  }

  call(name, ...args) {
    calls.push([name, ...args]);
    const fn = functions[name];
    if (!fn) {
      throw new Error(`Unexpected LiveAPI call: ${name}`);
    }
    return fn.apply(null, args);
  }
}
