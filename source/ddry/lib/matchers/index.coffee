'use strict'

helpers = require './helpers'
dotted = require '../common/dotted'
object = require '../common/object'
unordered = require '../common/unordered'

module.exports =
  default: (spec, specSet) ->
    _ =
      actual: helpers.getActual spec, specSet
      expected: spec.expected

  anyOrder: (spec, specSet) ->
    actual = helpers.getActual spec, specSet
    _ =
      actual: unordered.compare actual, spec.expected
      expected: unordered.clean

  plain: (spec, specSet) ->
    _ =
      actual: spec.input
      expected: spec.expected

  property: (spec, specSet) ->
    helpers.getActual spec, specSet
    actual = {}
    code = helpers.getCode specSet
    for key, value of spec.expected
      actual[key] = dotted.parse code.that, key
    _ =
      actual: actual
      expected: spec.expected
