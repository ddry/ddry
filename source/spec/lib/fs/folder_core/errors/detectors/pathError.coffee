'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns failing folder path for title'
    i: [ 'title', 'failing/path', 'failing/path' ]
    e: [ 'title', 'failing/path' ]
  ,
    it: 'returns false if folder files loaded'
    i: [ 'title', 'success/path', [] ]
    e: false
  ]
