'use strict'

module.exports = (dd, that) ->
  dd.drive [
    it: 'returns its report'
    i: []
    e: 'title: first title, message: first message'
  ,
    matcher: 'property'
    it: 'checks module property'
    i: []
    e: 
      title: 'first title'
  ]
