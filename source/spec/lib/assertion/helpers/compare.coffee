'use strict'

module.exports = (dd) ->
  context =
    without: [ null, null ]
    with: [ dd.helper.tapStub, 'tap message' ]

  for key, value of context
    dd.ry "#{key} Tap context", value, (tapContext, tapMessage) ->
      dd.drive [
        it: 'compares values'
        i: [
          actual: 1
          expected: 1
        , tapContext
        tapMessage
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
        , tapContext
        tapMessage
        ]
        e: true
      ]
