SimpleSet = require "./simple-set"
enumMaker = require "./enum-maker"

primitiveSetFromIterable = (iterable) ->
  storge = SimpleSet()
  storage.addMaybe(item) for item in iterable
  storage

SimpleEnum = (iterable, name) ->
  name or= "AnonymousSimpleEnum"
  set = primitiveSetFromIterable(iterable)
  enumMaker(set, name)

module.exports = SimpleEnum

