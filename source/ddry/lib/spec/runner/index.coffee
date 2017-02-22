'use strict'

params = require './params'
testEngine = require '../../test/engine'

module.exports =
  parseSpecSetParams: (code, name, dd, tapeContext) ->
    _ =
      code: code
      harness: dd.harness
      instanceNames: dd.instanceNames
      instancesList: dd.instancesList
      matchers: dd.matchers
      methodName: name
      sharedSpecKeys: {}
      specs: []
      tapeContext: tapeContext
      use: dd.use

  process: (specSet, code, name, dd, tapeContext) ->
    specSetParams = @.parseSpecSetParams code, name, dd, tapeContext
    specSet = [ specSet ] unless Array.isArray specSet
    specSet = @.processSpecSet specSet, specSetParams
    testEngine.outputTape specSet
    specSet

  processSpecSet: (specSet, specSetParams) ->
    for spec in specSet
      specParams = params.collect spec, specSetParams
      testEngine.outputMocha specParams, specSetParams if specParams
      specs = specSetParams.specs.concat specParams
      specSetParams.specs = specs
    specSetParams
