'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns false if no spec object given'
    i: [ ]
    e: false
  ,
    it: 'returns false if input data missing'
    i: [ e: true ]
    e: false
  ,
    it: 'returns false if expected data missing'
    i: [ i: [ 'data' ] ]
    e: false
  ,
    it: 'returns true if both parts of assertion present'
    i: [
      i: []
      e: undefined
    ]
    e: true
  ]
