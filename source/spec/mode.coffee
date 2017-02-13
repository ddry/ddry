'use strict'

module.exports =
  run: (edge, params) ->
    return @.edge params if edge
    @.ddry params

  edge: (params) ->
    Edge = require '../edge'
    dd = new Edge()
    dd.module
      prefix: '../../'
    dd.modular params
