'use strict'

DataDriven = require '../index'
requireSafe = require '../lib/require_safe'

module.exports =
  dd: (path = '') ->
    dd = new DataDriven path
    dd.module
      prefix: '../'
    dd.muteOutput()
    dd

  f: -> 1

  requireSafe: (params) ->
    requireSafe params
