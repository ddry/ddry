'use strict'

module.exports =
  single: (spec) ->
    keys = Object.keys spec
    return false if keys.indexOf('i') is -1
    return false if keys.indexOf('e') is -1
    true

  sequence: (spec, specParams) ->
    return false unless spec.data and typeof spec.data is 'object'
    true
