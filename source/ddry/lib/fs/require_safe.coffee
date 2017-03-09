###
# Safe require wrapper
###

'use strict'

core = require './require_safe_core'

module.exports = (params) ->
  if typeof params is 'string'
    params =
      title: params
      path: params
  if params.prefix
    core.setPrefix params.prefix
  return false unless params.title? and params.path?
  core.loadModule params.title, params.path
