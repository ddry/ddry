'use strict'

module.exports = (dd) ->
  dd.drive
    it: 'checks array element values ignoring order'
    i: [ null, [1, 2], [2, 1] ]
    e: true
