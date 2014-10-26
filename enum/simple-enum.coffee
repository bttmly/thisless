enumFactory = require "./enum-factory"

SimpleEnum = (iterable, name) ->
  name or= "AnonymousSimpleEnum"
  enumFactory(iterable, name)

module.exports = SimpleEnum

