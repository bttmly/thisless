delegateToComponent = (target, components...) ->
  for component in components
    for own key of component
      do (key, component) ->
        target[key] = ->
          result = component.apply component, arguments
          return if result is component then target else result

module.exports = delegateToComponent

