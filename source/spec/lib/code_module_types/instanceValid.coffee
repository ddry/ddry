'use strict'

module.exports = (dd) ->
  instance = dd.helper.requireSafe 'spec/examples/code/lib/instance'

  dd.drive [
    it: 'returns false for non-function export'
    i: [ {}, {} ]
    e: false
  ,
    it: 'returns false for function export without initial values'
    i: [ {}, instance ]
    e: false
  ,
    it: 'returns true for function export with initial values'
    i: [
      initial: []
    , instance ]
    e: true
  ]
