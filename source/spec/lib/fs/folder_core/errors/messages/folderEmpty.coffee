'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns folder empty message for title and path'
    i: [ 'title', 'path' ]
    e:
      title: "Module 'title' folder empty"
      messages: [ "No files found in 'path'." ]
  ]
