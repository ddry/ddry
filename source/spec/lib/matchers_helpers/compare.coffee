'use strict'

module.exports = (dd) ->
  spec = (tapeContext, tapeMessage) ->
    dd.drive [
      it: 'compares objects comprehensively'
      i: [
        one: 1
        two: 2
      ,
        one: 1
        two: 2
      , tapeContext, tapeMessage ]
      e: true
    ,
      it: 'compares functions comprehensively'
      i: [ dd.helper.f, dd.helper.f, tapeContext, tapeMessage ]
      e: true
    ,
      it: 'compares plain values comprehensively'
      i: [ 'line', 'line', tapeContext, tapeMessage ]
      e: true
    ]

  dd.context 'Without Tape context', ->
    spec()

  dd.context 'With Tape context', ->
    spec dd.helper.t, 'tape message'
