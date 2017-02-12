'use strict'

DataDriven = require '../index'
requireSafe = require '../lib/require_safe'
MethodContext = require '../lib/method_context'

module.exports =
  dd: (path = '') ->
    dd = new DataDriven path
    dd.module
      prefix: '../'
    dd.muteOutput()
    dd

  f: -> 1

  requireSafe: (params) ->
    requireSafe
      prefix: '../'
    requireSafe params

  methodContext: MethodContext
