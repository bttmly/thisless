SimpleSet = require "./simple-set"

setFromIterable = (iterable) ->
  set = do SimpleSet
  set.addMaybe(item) for item in iterable
  set

enumFactory = (iterable, name) ->
  set = setFromIterable(iterable)
  values = Object.keys(set)
  instance = (val) ->
    unless instance.check(val)
      throw new Error """
        Enum #{name} doesn't contain #{val}."
        Enum values: #{Object.keys(set).join " ,"}
      """
    val

  instance.has = (val) -> set.has(val)
  instance.values = -> values
  instance

module.exports = enumMaker
