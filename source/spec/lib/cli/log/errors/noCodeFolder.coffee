'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns `noCodeFolder` error message'
    i: [ 'code' ]
    e: "Specified code folder #{dd.helper.c.bright 'code'} does not exist."
  ]
