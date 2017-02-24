'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns assertion unchanged if both sides are values'
    i: [
      actual: 1
      expected: 2
    ]
    e:
      actual: 1
      expected: 2
  ,
    it: 'returns assertion unchanged if both sides are arrays'
    i: [
      actual: [ 1 ]
      expected: [ 2 ]
    ]
    e:
      actual: [ 1 ]
      expected: [ 2 ]
  ,
    it: 'makes an array of actual to match expected'
    i: [
      actual: 1
      expected: [ 2 ]
    ]
    e:
      actual: [ 1 ]
      expected: [ 2 ]
  ,
    it: 'makes an array of expected to match actual'
    i: [
      actual: [ 1 ]
      expected: 2
    ]
    e:
      actual: [ 1 ]
      expected: [ 2 ]
  ]
