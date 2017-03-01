'use strict'

module.exports = (dd) ->
  ddry = dd.helper.ddry()

  dd.drive
    it: 'processes module spec folder'
    i: [ ddry, one: 1 ]
    e: true
