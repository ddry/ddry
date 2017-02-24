'use strict'

params = require './params'
testEngine = require '../../test/engine'

module.exports =
  parseSpecSetParams: (code, name, dd, tapContext) ->
    _ =
      code: code
      harness: dd.harness
      instanceNames: dd.instanceNames
      instancesList: dd.instancesList
      matchers: dd.matchers
      methodName: name
      sharedSpecKeys: {}
      specs: []
      tapContext: tapContext
      use: dd.use

  process: (specSet, code, name, dd, tapContext) ->
    specSetParams = @.parseSpecSetParams code, name, dd, tapContext
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
