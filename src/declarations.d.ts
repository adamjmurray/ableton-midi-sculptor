declare function post(...args: Array<any>): void // Max for Live's STDOUT mechanism (console.log doesn't exist)
declare function error(...args: Array<any>): void // Max for Live's STDERR mechanism

type ApiType = boolean | number | string | Array<boolean | number | string>
declare class LiveAPI {
  constructor(path: string)
  id: string
  get(property: string): ApiType
  call(...args: Array<ApiType>): ApiType
  // for testing:
  static handleGet(handler: (property: string) => void): void
  static handleCall(method: string, handler: (...args: ApiType[]) => void): void
}

declare interface ObjectConstructor {
  assign(...objects: Object[]): Object
  values(object: Object): any[]
}

declare interface String {
  includes(text: string, start?: number): boolean
}

declare interface Array<T> {
  find(predicate: (value: T, index: number, obj: Array<T>) => boolean, thisArg?: any): T | undefined;
  fill(value?: number): T
}

declare interface ReadonlyArray<T> {
  find(predicate: (value: T, index: number, obj: ReadonlyArray<T>) => boolean, thisArg?: any): T | undefined;
}