'use strict'

DataDriven = require '../index'
requireSafe = require '../lib/require_safe'

module.exports =
  dd: (path = '') ->
    dd = new DataDriven path
    dd.muteOutput()
    dd

  requireSafe: (params) ->
    requireSafe params
