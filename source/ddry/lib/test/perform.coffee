'use strict'

parseMethodName = require '../common/parse_method_name'
invoke = require './invoke'

module.exports = (spec, specSet) ->
  spec.before.call specSet.code if spec.before
  method = parseMethodName specSet.code, specSet.methodName
  actual = method.apply specSet.code, spec.input
  invoke.engine spec, specSet, actual
  spec.after.call specSet.code if spec.after
