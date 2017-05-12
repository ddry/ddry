'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns parameterized message of given code'
    i: [ 'noTitle', 'filePath' ]
    e: "No title defined in #{dd.helper.c.bright 'filePath'}"
  ,
    it: 'logs parameterized message of given code if unmuted'
    i: [ 'empty', null, true ]
    e: ''
  ]
