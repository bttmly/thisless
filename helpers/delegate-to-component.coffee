delegateToComponent = (target, components...) ->
  for component in components
    do (component) ->
      for own key of component
        do (key) ->
          target[key] = ->
            result = component.apply component, arguments
            return if result is component then target else result

module.exports = delegateToComponent
