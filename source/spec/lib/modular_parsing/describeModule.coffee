'use strict'

module.exports = (dd) ->
  dd.drive [
    it: "returns false if no params given"
    i: []
    e: false
  ,
    it: "delegates module describing to Test engine interface"
    i: [ {}, {} ]
    e: true
  ]
