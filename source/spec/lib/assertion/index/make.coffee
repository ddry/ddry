'use strict'

module.exports = (dd) ->
  code = dd.helper.examples.numbering
  specSet = 
    code: code
    root: code
    that: code
    instanceNames: {}
    instancesList: {}
    matchers: dd.helper.requireSafe 'lib/matchers'
    methodName: 'ordinal'
    sharedSpecKeys: {}
    specs: []
    tapContext: dd.helper.tapStub
    use: false

  [ 'mocha', 'tap', 'tape' ].forEach (harness) ->
    data = dd.helper.extend specSet,
      harness: harness
    , true
    dd.ry "With #{harness} as harness", [ data ], (specSet) ->
      dd.drive [
        it: 'x-skips assertion'
        i: [
          matcher: 'default'
          mochaMethod: 'xit'
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
