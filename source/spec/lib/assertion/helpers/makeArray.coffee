'use strict'

module.exports = (dd) ->
  dd.drive
    it: 'makes array of value of given hash key'
    i: [
      one: 1
      two: 2
    , 'two' ]
    e:
      one: 1
      two: [ 2 ]
