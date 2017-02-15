'use strict'

SpecData = require './spec_data'

module.exports =
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

  validate: (spec) ->
    return false unless spec and typeof spec is 'object'
    keys = Object.keys spec
    return false if keys.indexOf('i') is -1
    return false if keys.indexOf('e') is -1
    true

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

  composeSpecMessage: (specParams, input, expected, inputAlias, expectedAlias) ->
    message = @.messageGenerator inputAlias, expectedAlias
    @.setSpecData specParams, input, expected, message

  setSpecData: (specParams, input, expected, message) ->
    sp = specParams
    new SpecData sp.mochaMethod, sp.matcher, input, expected, message, sp.before, sp.after
