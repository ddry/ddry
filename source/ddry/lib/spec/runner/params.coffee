###
# Data-driven spec params parsing
###

'use strict'

data = require './data'
detect = require './detect'
object =  require '../../common/object'

module.exports =
  mochaMethods: [ 'xit', 'xspecify', 'it', 'specify' ]

  applyMassPending: (spec, specParams) ->
    specMethod = object.match spec, @.mochaMethods, true
    specParams.mochaMethod = specMethod
    paramsMethod = object.match specParams, @.mochaMethods, true
    return spec unless /x/.test paramsMethod
    specMessage = spec[specMethod]
    delete spec[specMethod]
    pendingMessage = @.getPendingMessage specParams[paramsMethod]
    spec[paramsMethod] = @.setSpecMessage pendingMessage, specMessage
    spec.mochaMethod = paramsMethod
    specParams.mochaMethod = paramsMethod
    spec

  collect: (spec, specSetParams) ->
    if !detect.single(spec) and !detect.sequence(spec)
      specSetParams.sharedSpecKeys = spec
      return []
    specParams =
      matcher: spec.matcher ? 'default'
    specParams = object.extend specParams, specSetParams.sharedSpecKeys
    spec = @.applyMassPending spec, specParams
    specParams.before = spec.before if spec.before
    specParams.after = spec.after if spec.after
    data.process spec, specParams

  getPendingMessage: (message) ->
    return 'pending' unless typeof message is 'string'
    return 'pending' unless message.length
    message

  messageFunction: (pending, spec) ->
    (i, e) -> "#{pending}: #{spec i, e}"

  setSpecMessage: (pending, spec) ->
    return "#{pending}: #{spec}" if typeof spec is 'string'
    @.messageFunction pending, spec


