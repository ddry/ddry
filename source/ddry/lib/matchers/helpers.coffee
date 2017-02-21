'use strict'

getMethod = require '../common/get_method'
unordered = require '../common/unordered'

module.exports =
  anyOrder: (actual, expected) ->
    _ =
      actual: unordered.compare actual, expected
      expected: unordered.clean

  getActual: (spec, specSet) ->
    method = getMethod specSet.code, specSet.methodName
    actual = method.apply specSet.code, spec.input

  getMethod: (code, key) ->
    getMethod code, key
