function toString(value: any) {
  if(value != null) {
    if (value instanceof Array) {
      return `[ ${value.map(item => toString(item)).join(', ')} ]`
    }
    else if (value.toString) {
      var str = value.toString();
      return str.includes('[object ') ? JSON.stringify(value) : str
    }
    else return value
  }
  else return value === null ? '<null>' : '<undefined>'
}

export function log(...args: any[]) {
  for(let i=0; i<arguments.length; i++) {
    post(toString(arguments[i]))
  }
  post('\n')
}
