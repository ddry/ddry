'use strict'

report = require('../../common/object/report').create
initial = require './initial'

module.exports =
  valid: (params, code) ->
    return false unless typeof code is 'function'
    return true if Array.isArray params.initial
    return false unless params.initial and typeof params.initial is 'object'
    initials = report params.initial, true
    for key, value of initials
      return false unless Array.isArray value
    true

  process: (dd, params, code) ->
    instances = initial.parse code, params.initial
    dd = initial.mount dd, instances
    dd.constructors[dd.path] = code
    dd.generators[dd.path] = {}
    dd.that = dd.modules[dd.path]
