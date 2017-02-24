'use strict'

module.exports = (dd) ->
  dd.drive
    it: 'extends hi hash with lo'
    i: [
      one: 'one'
      two: 2
      three: 'III'
    ,
      one: 1
      three: 3
      four: 4
    ]
    e:
      one: 1
      two: 2
      three: 3
      four: 4
