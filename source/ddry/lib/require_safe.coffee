'use strict'

wrapping = require './require_safe_wrapping'

module.exports = (params) ->
  if params.prefix
    wrapping.setPrefix params.prefix
  return false unless params.title? and params.path?
  wrapping.loadModule params.title, params.path
