'use strict'

module.exports =
  mergeHashes: (lo, hi) ->
    for key, value of hi
      lo[key] = value
    lo

  dd: (path = '') ->
    DataDriven = @.dataDriven
    dd = new DataDriven path
    dd.module
      prefix: '../'
    dd.muteOutput()
    dd

  run: (edge, params) ->
    return @.edge params if edge
    @.ddry params

  edge: (params) ->
    @.initImports '../'
    Edge = require '../edge'
    dd = new Edge()
    dd.module
      prefix: '../../'
    dd.modular params

  initImports: (prefix) ->
    @.dataDriven = require "#{prefix}index"
    @.methodContext = require "#{prefix}lib/method_context"
    @.requireSafeProxy = require "#{prefix}lib/require_safe"

  f: -> 1

  requireSafe: (params) ->
    @.requireSafeProxy
      prefix: '../'
    @.requireSafeProxy params
