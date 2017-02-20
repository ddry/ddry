'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'detects Mocha presence'
    i: [ true ]
    e: 'mocha'
  ,
    it: 'detects Tape presence'
    i: [ false, true ]
    e: 'tape'
  ,
    it: 'assumes that at least TAP presents'
    i: [ false, false ]
    e: 'tap'
  ]