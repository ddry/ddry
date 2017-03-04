'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns true if key is in array of keys'
    i: [ 'name', [ 0, 1, 'name' ] ]
    e: true
  ,
    it: 'returns false if simple key is not in array of keys'
    i: [ 'name', [ 0, 1 ] ]
    e: false
  ,
    it: 'returns true if dotted parent key is in array of keys'
    i: [ 'a.little.deeper.name', [ 0, 1, 'a.little' ] ]
    e: true
  ,
    it: 'returns false if dotted parent key is not in array of keys'
    i: [ 'a.little.deeper.name', [ 0, 1, 'little' ] ]
    e: false
  ]
