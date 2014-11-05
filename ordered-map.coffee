OrderedMap = ->

  storage = Object.create null
  
  head = null
  tail = null
  size = 0

  instance =

    push: (key, value) ->
      prev_tail = tail
      item =
        prev: prev_tail
        next: null
        value: value
        key: key

      tail = 
      prev_tail.next = 
      storage[key] =
        item

      storage[key] = item
      head = item unless head?
      size += 1

    pop: ->
      return null unless tail
      prev_tail = tail
      tail = prev_tail.prev
      tail.next = null
      size -= 1
      prev_tail.value

    unshift: (key, value) ->
      prev_head = head

      item = 
        value: value
        prev: null
        next: prev_head
        key: key

      head = 
      prev_head.prev = 
      storage[key] =
        item

      tail = item unless tail
      size += 1

    shift: ->
      return null unless head
      prev_head = head
      head = prev_head.next
      head.prev = null
      size -= 1
      prev_head.value


    get: (key) ->
      ret = storage[key]
      if ret? then ret else null

    remove: (key) ->
      item = instance.get key
      return null unless item?

      if item is head
        return instance.shift()

      if item is tail
        return instance.pop()

      item.prev.next = item.next
      item.next.prev = item.prev
      item.value

    keys: ->
      ret = Array size
      item = head
      while item?
        ret.push item.key
        item = item.next
      ret

    forEach: (cb) -> 
      item = head
      while item?
        cb item.key, item.value
        item = item.next
      undefined

    tail: -> tail

    head: -> head


  instance