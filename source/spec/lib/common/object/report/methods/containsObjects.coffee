'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns false if no array given'
    i: [ {} ]
    e: false
  ,
    it: 'returns false if given array is serializable'
    i: [ [ 1, 2, 'line', false, null ] ]
    e: false
  ,
    it: 'returns true if given array contains objects'
    i: [ [ {} ] ]
    e: true
  ,
    it: 'returns true if given array contains arrays'
    i: [ [ [] ] ]
    e: true
  ,
    it: 'returns true if given array contains functions'
    i: [ [ dd.helper.f ] ]
    e: true
  ]
