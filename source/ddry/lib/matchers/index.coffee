'use strict'

dotted = require '../common/dotted'
helpers = require './helpers'
report = require('../common/object/report').create
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

  contains: (spec, specSet) ->
    actual = helpers.getActual spec, specSet
    actual = report actual
    expected = report spec.expected
    _ =
      actual: unordered.compare(actual, expected).extra
      expected: []

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
