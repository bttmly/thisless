argTypes = (args, types...) ->
  for arg, i in args
    if typeof arg isnt types[i]
      return false
  true

Emitter = ->
  events = Object.create null
  instance =
    on: (name, handler) ->
      unless argTypes arguments, "string", "function"
        throw new Error "Emitter.on() requires a string event name and a handler function"
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
      handler.apply( null, args ) for handler in events[name]
      instance

  instance

module.exports = Emitter
