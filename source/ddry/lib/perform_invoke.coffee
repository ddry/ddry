'use strict'

module.exports =
  engine: (spec, specSet, actual) ->
    @.actual = actual
    return @.tape spec, specSet unless typeof describe is 'function'
    specSet.matchers[spec.matcher] specSet.code, @.actual, spec.expected

  tape: (spec, specSet) ->
    return specSet.tapeContext.skip spec.message if /x/.test spec.mochaMethod
    specSet.matchers[spec.matcher] specSet.code, @.actual, spec.expected, specSet.tapeContext, spec.message
