enumMaker = require "./enum-factory"

inclusiveRange = (start, stop) ->
  i for i in [start..stop]

EnumRange = (start, stop, without, name) ->
  without or= []
  name or= "AnonymousEnumRange"
  nums = (i for i in inclusiveRange(start, stop) when i not in without)
  enumMaker(nums, name)

module.exports = EnumRange
