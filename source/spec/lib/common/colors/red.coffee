'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'paints given string red'
    i: [ 'line' ]
    e: "\x1b[31mline\x1b[0m"
  ]
