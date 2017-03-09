###
# Default matchers set
###

'use strict'

dotted = require '../common/dotted'
getActual = require './get_actual'
report = require('../common/object/report').create
unordered = require '../common/unordered'

module.exports =
  default: (spec, specSet) ->
    _ =
      actual: getActual spec, specSet
      expected: spec.expected

  anyOrder: (spec, specSet) ->
    actual = getActual spec, specSet
    _ =
      actual: unordered.compare actual, spec.expected
      expected: unordered.clean

  contains: (spec, specSet) ->
    actual = getActual spec, specSet
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
    getActual spec, specSet
    actual = {}
    for key, value of spec.expected
      actual[key] = dotted.parse specSet.that, key
    _ =
      actual: actual
      expected: spec.expected
