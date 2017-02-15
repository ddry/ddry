'use strict'

module.exports = (dd) ->
  dd.drive
    it: 'detects Mocha presence'
    i: []
    e: typeof describe is 'function'
