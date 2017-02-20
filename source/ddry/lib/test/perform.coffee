'use strict'

getMethod = require '../common/get_method'
invoke = require './invoke'

module.exports = (spec, specSet) ->
  spec.before.call specSet.code if spec.before
  method = getMethod specSet.code, specSet.methodName
  actual = method.apply specSet.code, spec.input
  invoke.engine spec, specSet, actual
  spec.after.call specSet.code if spec.after
