'use strict'

module.exports = (dd) ->
  errorHash = dd.helper.requireSafe 'lib/code/errors'
  dd.drive [
    it: "returns false if no errors found"
    i: [ errorHash, [ 'title', dd.helper.f, 'name', true ] ]
    e: false
  ,
    it: "delegates found errors output to test engine and returns true"
    i: [ errorHash, [ 'title', null, 'name', false ] ]
    e: true
  ]
