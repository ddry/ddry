'use strict'

extend = require('../common/object').extend

module.exports =
  composeSpecMessage: (specParams, input, expected, inputAlias, expectedAlias) ->
    message = @.messageGenerator inputAlias, expectedAlias
    @.setSpecData specParams, input, expected, message

  parse: (specSequence, specIndex, specParams) ->
    @.messageGenerator = specSequence[specParams.mochaMethod]
    spec = specSequence.data[specIndex - specSequence.from]
    fixtureValid = @.validate spec
    if fixtureValid
      specParams = @.parseFixture spec, specParams
    else
      message = @.messageGenerator specIndex, spec
      specParams = @.setSpecData specParams, [ specIndex ], spec, message
    specParams

  parseFixture: (spec, specParams) ->
    if Array.isArray spec.i
      specParams = @.composeSpecMessage specParams, spec.i, spec.e, spec.i, spec.e
    else
      for key, value of spec.i
        inputAlias = key
        input = value
      for key, value of spec.e
        expectedAlias = key
        expected = value
      specParams = @.composeSpecMessage specParams, input, expected, inputAlias, expectedAlias
    specParams

  setSpecData: (specParams, input, expected, message) ->
    specParams = extend specParams,
      expected: expected
      input: input
      message: message
    extend {}, specParams, true

  validate: (spec) ->
    return false unless spec and typeof spec is 'object'
    keys = Object.keys spec
    return false if keys.indexOf('i') is -1
    return false if keys.indexOf('e') is -1
    true
