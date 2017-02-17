'use strict'

module.exports = (dd) ->
  dd.drive [
    it: "delegates context setting to Test engine interface"
    i: [ 'type', 'title', 'specs'  ]
    e: true
  ]
