'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns empty folder path for title'
    i: [ 'title', 'empty/path', [] ]
    e: [ 'title', 'empty/path' ]
  ,
    it: 'returns false if folder files loaded'
    i: [ 'title', 'success/path', [ 1 ] ]
    e: false
  ]
