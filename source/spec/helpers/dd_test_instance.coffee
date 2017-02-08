'use strict'

DataDriven = require '../../index'

module.exports = (path) ->
  dd = new DataDriven 'path'
  dd.muteOutput()
  dd
