'use strict'

module.exports = (dd, that) ->
  dd.drive [
    it: 'Sets instance property'
    i: [ 'prop01',
      one: -> 1
      two: -> 2 ]
    e: ->
      "prop01.one": -> 1
      "prop01.two": -> 2
    ]
