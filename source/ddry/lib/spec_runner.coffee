'use strict'

sequenceSyntax = require './sequence_syntax'
testEngine = require './test_engine'

module.exports =
  mochaMethods: [ 'xit', 'xspecify', 'it', 'specify' ]

  process: (specSet, code, name, matchers, use, tapeContext) ->
    specSetParams = @.parseSpecSetParams code, name, matchers, use, tapeContext
    specSet = [ specSet ] unless Array.isArray specSet
    specSet = @.processSpecSet specSet, specSetParams
    testEngine.outputTape specSet
    specSet

  parseSpecSetParams: (code, name, matchers, use, tapeContext) ->
    _ =
      code: code
      matchers: matchers
      methodName: name
      sharedSpecKeys: {}
      specs: []
      tapeContext: tapeContext
      use: use

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
    specParams.mochaMethod = @.getMochaMethod spec
    specParams.before = spec.before if spec.before
    specParams.after = spec.after if spec.after
    @.processSpecData spec, specParams

  getMochaMethod: (spec) ->
    keys = Object.keys spec
    for mochaMethod in @.mochaMethods
      return mochaMethod if keys.indexOf(mochaMethod) isnt -1
    false

  applyMochaMethod: (spec, specParams) ->
    paramsMethod = @.getMochaMethod specParams
    return false unless paramsMethod
    spec[paramsMethod] = specParams[paramsMethod]

  processSpecData: (spec, specParams) ->
    _ = if @.itIsSequence spec, specParams
    then @.generateSequence spec, specParams
    else @.generateSingle spec, specParams

  itIsSingle: (spec) ->
    return false unless spec.i?
    return false unless spec.e?
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
