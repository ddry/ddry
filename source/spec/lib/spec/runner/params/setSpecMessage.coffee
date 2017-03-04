'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns message string if original spec message is string'
    i: [ 'pending', 'does smth' ]
    e: 'pending: does smth'
  ,
    it: 'returns message function if original spec message is function'
    i: [ 'pending', dd.helper.message ]
    e: dd.that.messageFunction
  ]
