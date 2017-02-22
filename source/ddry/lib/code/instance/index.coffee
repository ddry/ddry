'use strict'

object = require '../../common/object'
parseInitial = require './parse_initial'

module.exports =
  valid: (params, code) ->
    return false unless typeof code is 'function'
    return true if Array.isArray params.initial
    return false unless params.initial and typeof params.initial is 'object'
    initials = object.report params.initial, true
    for key, value of initials
      return false unless Array.isArray value
    true

  process: (dd, params, code) ->
    instances = parseInitial code, params.initial, dd.path
    dd = object.mergeObjects dd, instances
    dd.constructors[dd.path] = code
    dd.generators[dd.path] = {}
    dd.that = dd.modules[dd.path]
