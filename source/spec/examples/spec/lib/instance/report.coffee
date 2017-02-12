'use strict'

module.exports = (dd, that) ->
  dd.drive [
    it: 'returns its report'
    i: []
    e: 'title: title, message: message'
  ,
    it: 'checks module property'
    i: []
    e: -> title:
      'title'
  ]
