'use strict'

wrapping = require './require_safe_wrapping'

module.exports = (params) ->
  if params.prefix
    wrapping.prefix = params.prefix
  wrapping.loadModule params.title, params.path
