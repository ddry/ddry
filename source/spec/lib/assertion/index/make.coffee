'use strict'

module.exports = (dd) ->
  specSet = 
    code: dd.helper.examples.numbering
    instanceNames: {}
    instancesList: {}
    matchers: dd.helper.requireSafe 'lib/matchers'
    methodName: 'ordinal'
    sharedSpecKeys: {}
    specs: []
    tapContext: null
    use: false

  spec = (specSet)->
    dd.drive [
      it: 'x-skips assertion'
      i: [
        matcher: 'default'
        xit: 'returns 1st for 1'
        input: [ 1 ]
        expected: '1st'
      , specSet
      ]
      e: true
    ,
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

  [ 'mocha', 'tap', 'tape' ].forEach (harness) ->
    dd.context "With #{harness} as harness", ->
      specData = dd.helper.extend specSet,
        harness: harness
      , true
      spec specData
