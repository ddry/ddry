'use strict'

sequenceSyntax = require './syntax'
testEngine = require '../test/engine'

module.exports =
  mochaMethods: [ 'xit', 'xspecify', 'it', 'specify' ]

  process: (specSet, code, name, dd, tapeContext) ->
    specSetParams = @.parseSpecSetParams code, name, dd, tapeContext
    specSet = [ specSet ] unless Array.isArray specSet
    specSet = @.processSpecSet specSet, specSetParams
    testEngine.outputTape specSet
    specSet

  parseSpecSetParams: (code, name, dd, tapeContext) ->
    _ =
      code: code
      harness: dd.harness
      matchers: dd.matchers
      methodName: name
      sharedSpecKeys: {}
      specs: []
      tapeContext: tapeContext
      use: dd.use

  processSpecSet: (specSet, specSetParams) ->
    for spec in specSet
      specParams = @.collectSpecParams spec, specSetParams
      testEngine.outputMocha specParams, specSetParams if specParams
      specs = specSetParams.specs.concat specParams
      specSetParams.specs = specs
    specSetParams

  collectSpecParams: (spec, specSetParams) ->
    if !@.itIsSingle(spec) and !@.itIsSequence(spec)
      specSetParams.sharedSpecKeys = spec
      return []
    specParams =
      matcher: spec.matcher ? 'default'
    @.addSharedKeys specParams, specSetParams
    @.applyMochaMethod spec, specParams
    specParams.before = spec.before if spec.before
    specParams.after = spec.after if spec.after
    @.processSpecData spec, specParams

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

  applyMochaMethod: (spec, specParams) ->
    paramsMethod = @.getMochaMethod specParams
    if paramsMethod
      pendingMessage = @.getPendingMessage specParams[paramsMethod]
      specMessage = spec[@.getMochaMethod spec]
      spec[paramsMethod] = @.setSpecMessage pendingMessage, specMessage
    specParams.mochaMethod = @.getMochaMethod spec

  processSpecData: (spec, specParams) ->
    _ = if @.itIsSequence spec, specParams
    then @.generateSequence spec, specParams
    else @.generateSingle spec, specParams

  itIsSingle: (spec) ->
    keys = Object.keys spec
    return false if keys.indexOf('i') is -1
    return false if keys.indexOf('e') is -1
    true

  itIsSequence: (spec, specParams) ->
    return false unless spec.data and typeof spec.data is 'object'
    true

  addSharedKeys: (specParams, specSetParams) ->
    return unless Object.keys(specSetParams.sharedSpecKeys).length
    for key, value of specSetParams.sharedSpecKeys
      specParams[key] = value
    specParams

  generateSingle: (spec, specParams) ->
    [ sequenceSyntax.setSpecData specParams, spec.i, spec.e, spec[specParams.mochaMethod] ]

  generateSequence: (specSequence, specParams) ->
    sequence = []
    from = specSequence.from ? 1
    specSequence.from = from
    till = from + specSequence.data.length - 1
    for specIndex in [from..till]
      sequence.push sequenceSyntax.parse specSequence, specIndex, specParams
    sequence
