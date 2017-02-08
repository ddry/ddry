'use strict'

parseMethodName = require './parse_method_name'

module.exports = (spec, specSet) ->
  spec.before.call specSet.code if spec.before
  method = parseMethodName specSet.code, specSet.methodName
  actual = method.apply specSet.code, spec.input
  if typeof describe is 'function'
    specSet.matchers[spec.matcher] specSet.code, actual, spec.expected
  else
    specSet.matchers[spec.matcher] specSet.code, actual, spec.expected, specSet.tapeContext, spec.message
  spec.after.call specSet.code if spec.after
