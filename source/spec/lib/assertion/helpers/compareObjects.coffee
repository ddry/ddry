'use strict'

module.exports = (dd) ->
  dd.context 'Without Tap context', ->
    dd.drive
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
  dd.context 'With Tap context', ->
    dd.drive
      it: 'compares objects'
      i: [
        actual:
          one: 1
          two: 2
        expected:
          one: 1
          two: 2
      , dd.helper.tapeStub
      'tap message'
      ]
      e: true
