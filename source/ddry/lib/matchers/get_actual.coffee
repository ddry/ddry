'use strict'

dotted = require '../common/dotted'

module.exports = (spec, specSet) ->
  method = dotted.parse specSet.root, specSet.methodName, false
  method.apply specSet.that, spec.input
