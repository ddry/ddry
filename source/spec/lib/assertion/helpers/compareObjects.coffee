'use strict'

module.exports = (dd) ->
  dd.drive
    it: 'compares objects'
    i: [
      actual:
        one: 1
        two: 2
      expected:
        one: 1
        two: 2
    ]
    e: true
