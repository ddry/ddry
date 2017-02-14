'use strict'

module.exports = (dd) ->
  dd.context 'Without Tape context', ->
    dd.drive [
      it: 'compares objects comprehensively'
      i: [
        one: 1
        two: 2
      ,
        one: 1
        two: 2
      ]
      e: true
    ,
      it: 'compares functions comprehensively'
      i: [ dd.helper.f, dd.helper.f ]
      e: true
    ,
      it: 'compares plain values comprehensively'
      i: [ 'line', 'line' ]
      e: true
    ]

  dd.context 'With Tape context', ->
    dd.helper.tape.test 'tape test', (t) ->
      dd.drive [
        it: 'compares objects comprehensively'
        i: [
          one: 1
          two: 2
        ,
          one: 1
          two: 2
        , t, 'tapeMessage' ]
        e:
          extra: []
          missing: []
      ,
        it: 'compares functions comprehensively'
        i: [ dd.helper.f, dd.helper.f ]
        e:
          extra: []
          missing: []
      ,
        it: 'compares plain values comprehensively'
        i: [ 'line', 'line' ]
        e:
          extra: []
          missing: []
      ]
      t.end()
