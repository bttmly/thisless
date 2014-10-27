isPrimitive = (val) ->
  type = typeof val
  type is "string" or type is "number" or type is "boolean"

PrimitiveSet = ->
  storage = Object.create null
  set =
    has: (val) ->
      return !!storage[val]

    add: (val) ->
      throw new Error("SimpleSet accepts only primitives") unless isPrimitive(val)
      return false if set.has val
      storage[val] = true
      true

    addMaybe: (val) ->
      return set if addMaybe(val)
      throw new Error "Set already contains #{val}"

    remove: (val) ->
      return set if removeMaybe(val)
      throw new Error "Set doesn't contain #{val}"

    removeMaybe: ->
      return false unless set.has val
      delete storage[val]
      true

    size: -> set.values().length

    values: -> Object.keys(storage)

  set

module.exports = PrimitiveSet
