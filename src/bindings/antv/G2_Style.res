module StyleOption = {
  type looseObject
  external looseObject: 'a => looseObject = "%identity"

  type callback
  external callback: 'a => callback = "%identity"

  @deriving(abstract)
  type t = {
    @optional fields: array<string>,
    @optional callback: callback,
    @optional cfg: looseObject,
  }

  external unsafeMake: {..} => t = "%identity"
}
