###
# Test engine interface
###

'use strict'

forMocha = require('../common/harness').forMocha
assertion = require '../assertion'
outputs = require './outputs'
unless forMocha()
  tap = require './tap'

module.exports =
  output: true

  muteOutput: ->
    @.output = false

  modular: (dd, output = @.output, mocha, testTap) ->
    return false unless output
    mocha ?= forMocha()
    return false if mocha
    tap = tap or testTap
    tap.process dd
    true

  describeModule: (dd, params, specs) ->
    return false unless @.output
    return false unless forMocha()
    describe params.title, -> specs dd.that
    true

  describeMethod: (dd, name, specs) ->
    return false unless @.output
    return false unless forMocha()
    if dd.use
      specs dd, dd.that.use
      return true
    if typeof dd.methodName is 'boolean'
      specs dd, dd.that
    else
      describe "#{name}()", -> specs dd, dd.that
    true

  outputMocha: (specParams, specSet) ->
    return unless @.output
    return unless forMocha()
    if specSet.use
      specParams.forEach (spec) ->
        global[spec.mochaMethod] spec.message, ->
          specSet.matchers[spec.matcher] specSet.code, spec.input, spec.expected
    else
      specParams.forEach (spec) ->
        global[spec.mochaMethod] spec.message, ->
          assertion.make spec, specSet

  outputTape: (specSet) ->
    return unless @.output
    return if forMocha()
    for spec in specSet.specs
      assertion.make spec, specSet

  sendOutput: (harness, type, argArray) ->
    return false unless @.output
    outputs[type][harness].apply @, argArray
