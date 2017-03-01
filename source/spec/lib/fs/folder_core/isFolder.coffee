'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns false for non-existent path'
    i: [ 'failing/path' ]
    e: false
  ,
    it: 'returns false for file name'
    i: [ 'index.js' ]
    e: false
  ,
    it: 'returns true for folder name'
    i: [ 'lib' ]
    e: true
  ]
