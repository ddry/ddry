'use strict'

module.exports = (dd) ->
  dd.drive [
    it: "returns false if no specs given"
    i: []
    e: false
  ,
    it: "delegates method describing to Test engine interface"
    i: [ {}, 'name', 'specs/path' ]
    e: true
  ]
