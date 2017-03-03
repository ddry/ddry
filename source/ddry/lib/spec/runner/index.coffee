'use strict'

codeNodes = require './code_nodes'
extend = require('../../common/object').extend
params = require './params'
testEngine = require '../../test/engine'

module.exports =
  parseSpecSetParams: (code, name, dd, tapContext) ->
    specSet =
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
    extend specSet, codeNodes.get(specSet)

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
