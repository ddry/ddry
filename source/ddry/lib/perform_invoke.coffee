'use strict'

module.exports =
  engine: (spec, specSet, actual) ->
    @.actual = actual
    @[specSet.harness] spec, specSet

  mocha: (spec, specSet) ->
    specSet.matchers[spec.matcher] specSet.code, @.actual, spec.expected

  tape: (spec, specSet) ->
    return specSet.tapeContext.skip spec.message if /x/.test spec.mochaMethod
    specSet.matchers[spec.matcher] specSet.code, @.actual, spec.expected, specSet.tapeContext, spec.message

  tap: (spec, specSet) ->
    spec.message = "# skip #{spec.message}" if /x/.test spec.mochaMethod
    specSet.matchers[spec.matcher] specSet.code, @.actual, spec.expected, specSet.tapeContext, spec.message
