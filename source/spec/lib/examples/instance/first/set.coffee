'use strict'

module.exports = (dd) ->
  dd.drive [
    matcher: 'property'
    it: 'Sets instance property'
    i: [ 'prop01',
      first:
        one: 1
        two: -> 2 ]
    e:
      "prop01.first.one": 1
      "prop01.first.two": -> 2
    ]