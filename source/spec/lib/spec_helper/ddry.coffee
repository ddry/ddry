'use strict'
 
module.exports = (dd) ->
  ddry = dd.helper.ddry()

  dd.drive
    it: 'returns configured test DataDriven instance'
    i: []
    e: ddry
