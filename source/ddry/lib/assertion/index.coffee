'use strict'

helpers = require './helpers'

module.exports =
  make: (spec, specSet) ->
    spec.before.call specSet.code if spec.before
    @.data = specSet.matchers[spec.matcher] spec, specSet
    @[specSet.harness] spec, specSet
    spec.after.call specSet.code if spec.after
    true

  mocha: (spec, specSet) ->
    helpers.compare @.data

  tape: (spec, specSet) ->
    return specSet.tapContext.skip spec.message if /x/.test spec.mochaMethod
    helpers.compare @.data, specSet.tapContext, spec.message

  tap: (spec, specSet) ->
    spec.message = "# skip #{spec.message}" if /x/.test spec.mochaMethod
    helpers.compare @.data, specSet.tapContext, spec.message
