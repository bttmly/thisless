Emitter = require "../emitter/emitter.coffee"
delegateToComponent = require "../helpers/delegate-to-component.coffee"

Store = (id) ->

  items = Object.create null
  size = 0
  emitter = do Emitter

  getId = switch typeof id
    when "function" then id
    when "string" then (obj) -> obj[id]
    else do ->
      counter = 0
      -> counter += 1

  instance =
    get: (id) ->
      return if instance.has id then items[id] else null

    set: (obj) ->
      id = getId obj
      if items[id]?
        instance.update obj
      else
        instance.insert obj

    has: (id) ->
      items[id]?

    insert: (obj) ->
      id = getId obj
      if instance.has id
        throw new Error "Record with id #{id} already in instance."
      items[id] = obj
      size += 1
      instance

    update: (obj) ->
      id = getId obj
      unless instance.has id
        throw new Error "No record with id #{id} found to update."
      items[id] = obj
      instance

    unset: (id) ->
      if instance.has id then instance.remove id else instance

    remove: (id) ->
      unless instance.has id
        throw new Error "No record with id #{id} found to remove"
      delete items[id]
      size -= 1
      instance

    clear: ->
      items = Object.create null
      size = 0
      instance

    size: -> size

  delegateToComponent instance, emitter
  instance

