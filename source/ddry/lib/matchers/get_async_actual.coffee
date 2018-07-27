###
# Actual target code runner
###

'use strict'

dotted = require '../common/dotted'

module.exports = (spec, specSet) ->
  method = dotted.parse specSet.root, specSet.methodName, false
  promise = new Promise((resolve, reject) ->
    resolve(method.apply specSet.that, spec.input)
  )
  actual = null
  promise.then((result) ->
    actual = result
  )
  actual
