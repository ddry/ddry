'use strict'

specRunner = require './spec_runner'

MethodContext = (code, name, matchers, use) ->
  @.codeModule = code
  @.matchers = matchers
  @.tapeContext = null
  @.use = use
  @.methodName = name

MethodContext.prototype.init = (spec) ->
  specRunner.process spec, @.codeModule, @.methodName, @.matchers, @.use, @.tapeContext

module.exports = MethodContext
