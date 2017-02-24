'use strict'

module.exports = (dd) ->
  specSet = 
    code: dd.helper.examples.numbering
    harness: 'mocha'
    instanceNames: {}
    instancesList: {}
    matchers: dd.helper.requireSafe 'lib/matchers'
    methodName: 'ordinal'
    sharedSpecKeys: {}
    specs: []
    tapContext: null
    use: false

  dd.context 'With Mocha as harness', ->
    dd.drive [
      it: 'makes assertion without hooks'
      i: [
        matcher: 'default'
        it: 'returns 1st for 1'
        input: [ 1 ]
        expected: '1st'
      , specSet
      ]
      e: true
    ,
      it: 'makes assertion with hooks'
      i: [
        before: ->
          @.property = 'values'
        matcher: 'default'
        it: 'returns 1st for 1'
        input: [ 1 ]
        expected: '1st'
        after: ->
          delete @.property
      , specSet
      ]
      e: true
    ]

  dd.context 'With Tap as harness', ->
    tapSpecSet = dd.helper.extend specSet,
      harness: 'tap'
    dd.drive [
      it: 'makes assertion without hooks'
      i: [
        matcher: 'default'
        it: 'returns 1st for 1'
        input: [ 1 ]
        expected: '1st'
      , tapSpecSet
      ]
      e: true
    ,
      it: 'makes assertion with hooks'
      i: [
        before: ->
          @.property = 'values'
        matcher: 'default'
        it: 'returns 1st for 1'
        input: [ 1 ]
        expected: '1st'
        after: ->
          delete @.property
      , tapSpecSet
      ]
      e: true
    ]

  dd.context 'With Tape as harness', ->
    tapeSpecSet = dd.helper.extend specSet,
      harness: 'tape'
    dd.drive [
      it: 'makes assertion without hooks'
      i: [
        matcher: 'default'
        it: 'returns 1st for 1'
        input: [ 1 ]
        expected: '1st'
      , tapeSpecSet
      ]
      e: true
    ,
      it: 'makes assertion with hooks'
      i: [
        before: ->
          @.property = 'values'
        matcher: 'default'
        it: 'returns 1st for 1'
        input: [ 1 ]
        expected: '1st'
        after: ->
          delete @.property
      , tapeSpecSet
      ]
      e: true
    ]
