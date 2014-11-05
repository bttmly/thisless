isPrimitive = (val) ->
  type = typeof val
  type is "string" or type is "number" or type is "boolean"

PrimitiveSet = ->
  entries = Object.create null
  set =
    has: (val) ->
      entries[val]?

    add: (val) ->
      throw new Error("SimpleSet accepts only primitives") unless isPrimitive(val)
      entries[val] = true
      set

    remove: (val) ->
      ret = set.has val
      delete entries[val]
      ret

    size: -> set.entries().length

    entries: -> Object.keys entries

    clear: -> entries = Object.create null

  set

module.exports = PrimitiveSet
