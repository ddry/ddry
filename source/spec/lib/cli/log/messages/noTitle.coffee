'use strict'

module.exports = (dd) ->
  dd.drive
    it: 'returns `noTitle` message for given file path'
    i: [ 'filePath' ]
    e: "No title defined in #{dd.helper.c.bright 'filePath'}"
