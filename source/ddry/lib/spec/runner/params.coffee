'use strict'

data = require './data'
detect = require './detect'

module.exports =
  mochaMethods: [ 'xit', 'xspecify', 'it', 'specify' ]

  addSharedKeys: (specParams, specSetParams) ->
    return unless Object.keys(specSetParams.sharedSpecKeys).length
    for key, value of specSetParams.sharedSpecKeys
      specParams[key] = value
    specParams

  applyMochaMethod: (spec, specParams) ->
    paramsMethod = @.getMochaMethod specParams
    if paramsMethod
      pendingMessage = @.getPendingMessage specParams[paramsMethod]
      specMessage = spec[@.getMochaMethod spec]
      spec[paramsMethod] = @.setSpecMessage pendingMessage, specMessage
    specParams.mochaMethod = @.getMochaMethod spec

  collect: (spec, specSetParams) ->
    if !detect.single(spec) and !detect.sequence(spec)
      specSetParams.sharedSpecKeys = spec
      return []
    specParams =
      matcher: spec.matcher ? 'default'
    @.addSharedKeys specParams, specSetParams
    @.applyMochaMethod spec, specParams
    specParams.before = spec.before if spec.before
    specParams.after = spec.after if spec.after
    data.process spec, specParams

  getMochaMethod: (spec) ->
    keys = Object.keys spec
    for mochaMethod in @.mochaMethods
      return mochaMethod if keys.indexOf(mochaMethod) isnt -1
    false

  getPendingMessage: (message) ->
    return 'pending' unless typeof message is 'string'
    return 'pending' unless message.length
    message

  setSpecMessage: (pending, spec) ->
    return "#{pending}: #{spec}" if typeof spec is 'string'
    (i, e) -> "#{pending}: #{spec i, e}"
