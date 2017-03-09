###
# Spec runner syntax type detector
###

'use strict'

module.exports =
  single: (spec) ->
    keys = Object.keys spec
    return false if keys.indexOf('i') is -1
    return false unless Array.isArray(spec.i) or spec.matcher is 'plain'
    return false if keys.indexOf('e') is -1
    true

  sequence: (spec, specParams) ->
    return false unless Array.isArray spec.data
    return false unless spec.data.length
    true
