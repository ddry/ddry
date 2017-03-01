'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns path error message for title and path'
    i: [ 'title', 'path' ]
    e:
      title: "Module 'title' folder missing"
      messages: [ "Directory 'path' does not exist." ]
  ]
