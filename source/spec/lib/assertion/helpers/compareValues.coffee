'use strict'

module.exports = (dd) ->
  dd.context 'Without Tap context', ->
    dd.drive
      it: 'compares values'
      i: [
        actual: 1
        expected: 1
      ]
      e: true
  dd.context 'With Tap context', ->
    dd.drive
      it: 'compares values'
      i: [
        actual: 1
        expected: 1
      , dd.helper.tapeStub
      'tap message'
      ]
      e: true
