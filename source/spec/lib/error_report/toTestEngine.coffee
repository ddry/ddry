'use strict'

helper = require '../../spec_helper'
errorHash = helper.requireSafe 'lib/code_module_errors'

module.exports = (dd) ->
  dd.drive [
    it: "returns false if no errors found"
    i: [ errorHash, [ 'title', helper.f, 'name', true ] ]
    e: false
  ,
    it: "delegates found errors output to test engine and returns true"
    i: [ errorHash, [ 'title', null, 'name', false ] ]
    e: true
  ]
