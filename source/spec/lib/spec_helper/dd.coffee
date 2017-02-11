'use strict'
 
DataDriven = require '../../../index'

ddry = new DataDriven()
ddry.module
  prefix: '../'

module.exports = (dd) ->
  dd.drive
    it: 'returns configured test DataDriven instance'
    i: []
    e: ddry
