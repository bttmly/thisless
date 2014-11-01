Emitter = ->
  events = Object.create null
  instance =
    on: (name, handler) ->
      unless typeof handler is "function"
        throw new Error "Emitter.on() requires a handler function"
      events[name] or= []
      events[name].push handler
      instance

    off: (name, handler) ->
      return instance unless events[name]?
      i = events[name].indexOf handler
      while i > -1
        events[name].splice i, 1
        i = events[name].indexOf handler
      instance

    trigger: (name, args...) ->
      return instance unless events[name]?
      for handler in events[name]
        handler.apply null, args
      instance

  instance

module.exports = Emitter
