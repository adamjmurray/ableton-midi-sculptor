declare function post(...args: Array<any>) // Max for Live's STDOUT mechanism (console.log doesn't exist)

type ApiType = Boolean | Number | String | Array<Boolean|Number|String>
declare class LiveAPI {
  constructor(path: string)
  id: string
  get(property: string): ApiType
  call(...args: Array<ApiType>): ApiType
}

declare interface ObjectConstructor {
  assign(...objects: Object[]): Object
}

declare interface String {
   includes(text: string, start?: number): boolean
}

