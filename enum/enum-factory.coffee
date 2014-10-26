SimpleSet = require "./simple-set"

setFromIterable = (iterable) ->
  set = do SimpleSet
  set.addMaybe(item) for item in iterable
  set

enumFactory = (iterable, name) ->
  set = setFromIterable(iterable)
  values = Object.keys(set)

  enum_ =
    check: (val) ->
      set.has(val)

    checkStrict: (val) ->
      unless enum_.check(val)
        throw new Error """
          Enum #{name} doesn't contain #{val}."
          Enum values: #{Object.keys(set).join " ,"}
        """
      true

    values: -> values

  enum_

module.exports = enumMaker
