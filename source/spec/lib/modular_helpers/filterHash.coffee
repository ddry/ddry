'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'filters given hash with given keys'
    i: [
      one: 1
      two: 2
      three: 3
    , [ 'one', 'four' ]
    ]
    e: one: 1
  ]
