'use strict'

module.exports = (dd) ->
  dd.context 'Without Tap context', ->
    dd.drive [
      it: 'compares values'
      i: [
        actual: 1
        expected: 1
      ]
      e: true
    ,
      it: 'compares objects'
      i: [
        actual:
          one: 1
          two: 2
        expected:
          one: 1
          two: 2
      ]
      e: true
    ]
  dd.context 'With Tap context', ->
    dd.drive [
      it: 'compares values'
      i: [
        actual: 1
        expected: 1
      , dd.helper.tapStub
      'tap message'
      ]
      e: true
    ,
      it: 'compares objects'
      i: [
        actual:
          one: 1
          two: 2
        expected:
          one: 1
          two: 2
      , dd.helper.tapStub
      'tap message'
      ]
      e: true
    ]
