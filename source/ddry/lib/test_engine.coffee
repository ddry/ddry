'use strict'

performTest = require './perform_test'
testOutputs = require './test_outputs'
unless typeof describe is 'function'
  tapeRunner = require './tape_runner'

module.exports =
  output: true

  muteOutput: ->
    @.output = false

  forMocha: ->
    typeof describe is 'function'

  modular: (dd) ->
    return unless @.output
    unless @.forMocha()
      tapeRunner.process dd

  runModuleSpecFolder: (dd, title, methodList) ->
    return @.processMethodList dd, methodList unless @.forMocha()
    that = @
    describe title, ->
      that.processMethodList dd, methodList

  processMethodList: (dd, methodList) ->
    for methodName, methodFile of methodList
      dd.method methodName, methodFile

  describeModule: (dd, params, specs) ->
    return unless @.output
    return unless @.forMocha()
    describe params.title, -> specs dd.that

  describeMethod: (dd, name, specs) ->
    return unless @.output
    return unless @.forMocha()
    if dd.use
      specs dd, dd.that.use
      return
    if typeof dd.methodName is 'boolean'
      specs dd, dd.that
    else
      describe "#{name}()", -> specs dd, dd.that

  outputMocha: (specParams, specSet) ->
    return unless @.output
    return unless @.forMocha()
    if specSet.use
      specParams.forEach (spec) ->
        global[spec.mochaMethod] spec.message, ->
          specSet.matchers[spec.matcher] specSet.code, spec.input, spec.expected
    else
      specParams.forEach (spec) ->
        global[spec.mochaMethod] spec.message, ->
          performTest spec, specSet

  outputTape: (specSet) ->
    return unless @.output
    return if @.forMocha()
    for spec in specSet.specs
      performTest spec, specSet

  sendOutput: (type, argArray) ->
    return unless @.output
    return testOutputs[type].toMocha.apply @, argArray if @.forMocha()
    testOutputs[type].toTape.apply @, argArray
