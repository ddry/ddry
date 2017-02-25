'use strict'

module.exports = (dd) ->
  instance = dd.helper.examples.instance

  dd.drive [
    it: 'returns false for non-function export'
    i: [ {}, {} ]
    e: false
  ,
    it: 'returns false for function export without initial values'
    i: [ {}, instance ]
    e: false
  ,
    it: 'returns true for function export with single initial values'
    i: [
      initial: []
    , instance ]
    e: true
  ,
    it: 'returns false if multiple initial object empty'
    i: [
      initial: {}
    , instance ]
    e: false
  ,
    it: 'returns false if multiple initial object contains invalid data'
    i: [
      initial:
        right:
          one: []
          two: []
        wrong:
          one: 1
    , instance ]
    e: false
  ,
    it: 'returns true if multiple initial object data valid'
    i: [
      initial:
        right:
          one: []
          two: []
        left:
          one: []
    , instance ]
    e: true
  ]
