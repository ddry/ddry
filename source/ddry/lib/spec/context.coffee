'use strict'

specRunner = require './runner'

MethodContext = (code, name, dd) ->
  @.codeModule = code
  @.dd =
    harness: dd.harness
    matchers: dd.matchers
    use: dd.use
  @.tapeContext = null
  @.methodName = name

MethodContext.prototype.init = (spec) ->
  specRunner.process spec, @.codeModule, @.methodName, @.dd, @.tapeContext

module.exports = MethodContext