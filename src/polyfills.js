console = {
  log(...values) {
    values.forEach(message => {
      if (message && message.toString) {
        var s = message.toString();
        if (s.indexOf("[object ") >= 0) {
          s = JSON.stringify(message);
        }
        post(s);
      }
      else if (message === null) {
        post("<null>");
      }
      else {
        post(message);
      }
    });
    post("\n");
  }
}

// Object.assign()
if (typeof Object.assign != 'function') {
  // Must be writable: true, enumerable: false, configurable: true
  Object.defineProperty(Object, "assign", {
    value: function assign(target, _varArgs) {
      // .length of function is 2
      'use strict';

      if (target == null) {
        // TypeError if undefined or null
        throw new TypeError('Cannot convert undefined or null to object');
      }

      var to = Object(target);

      for (var index = 1; index < arguments.length; index++) {
        var nextSource = arguments[index];

        if (nextSource != null) {
          // Skip over if undefined or null
          for (var nextKey in nextSource) {
            // Avoid bugs when hasOwnProperty is shadowed
            if (Object.prototype.hasOwnProperty.call(nextSource, nextKey)) {
              to[nextKey] = nextSource[nextKey];
            }
          }
        }
      }

      return to;
    },
    writable: true,
    configurable: true
  });
} // Object.values()


if (typeof Object.values != 'function') {
  Object.defineProperty(Object, "values", {
    value: function values(obj) {
      var vals = [];

      for (var key in obj) {
        if (obj.hasOwnProperty(key)) {
          vals.push(obj[key]);
        }
      }

      return vals;
    },
    writable: true,
    configurable: true
  });
} // String.includes()


if (!String.prototype.includes) {
  String.prototype.includes = function(search, start) {
    'use strict';

    if (typeof start !== 'number') {
      start = 0;
    }

    if (start + search.length > this.length) {
      return false;
    } else {
      return this.indexOf(search, start) !== -1;
    }
  };
}

if (!Array.prototype.find) {
  Array.prototype.find = function(predicate, thisArg) {
    thisArg = thisArg || this;

    for (var i = 0; i < this.length; i++) {
      var value = this[i];

      if (predicate.call(thisArg, value, i, this)) {
        return value;
      }
    }

    return undefined;
  };
}