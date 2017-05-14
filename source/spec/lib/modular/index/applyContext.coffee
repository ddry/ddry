'use strict'

module.exports = (dd) ->
  ddry =
    that: true

  dd.drive
    it: 'applies data to spec then to function passed to the context'
    i: []
    e: ->
      spec.apply dd.that, data
