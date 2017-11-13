declare function post(...args: Array<any>): void // Max for Live's STDOUT mechanism (console.log doesn't exist)

type ApiType = boolean | number | string | Array<boolean|number|string>
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
