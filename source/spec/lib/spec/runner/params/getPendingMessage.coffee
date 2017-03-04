'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns "pending" if input type is not string'
    i: [ 0 ]
    e: 'pending'
  ,
    it: 'returns "pending" if input string is blank'
    i: [ '' ]
    e: 'pending'
  ,
    it: 'returns pending message if given'
    i: [ 'input' ]
    e: 'input'
  ]
