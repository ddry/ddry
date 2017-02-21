'use strict'

helpers = require './helpers'

module.exports =
  default: (spec, specSet) ->
    _ =
      actual: helpers.getActual spec, specSet
      expected: spec.expected

  anyOrder: (spec, specSet) ->
    actual = helpers.getActual spec, specSet
    helpers.anyOrder actual, spec.expected

  plain: (spec, specSet) ->
    _ =
      actual: spec.input
      expected: spec.expected

  property: (spec, specSet) ->
    helpers.getActual spec, specSet
    actual = {}
    for key, value of spec.expected
      actual[key] = helpers.getMethod specSet.code, key
    helpers.anyOrder actual, spec.expected
