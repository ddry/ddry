'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns pending message'
    i: [ 1, 1, 'yet pending', dd.helper.message ]
    e: 'yet pending: returns 1 for 1'
  ]
