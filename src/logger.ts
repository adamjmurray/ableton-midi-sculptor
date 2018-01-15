export function toString(value: any): string {
  if (value != null) {
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

export function log(...args: any[]): void {
  args.forEach(arg => post(toString(arg)))
  post('\n')
}
