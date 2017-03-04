'use strict'

module.exports = (dd) ->
  code = dd.helper.requireSafe 'spec/examples/code/numbering'
  specParams =
    code: code
    root: code
    that: code
    instanceNames: {}
    methodName: 'ordinal'
  singleSpec =
    before: dd.helper.f
    it: 'returns 21st for 21'
    i: [ 21 ]
    e: '21st'
    after: dd.helper.ff

  dd.drive [
    it: 'returns empty array if spec is shared setting'
    i: [ xit: 0, specParams ]
    e: []
  ,
    it: 'collects spec parameters if spec valid'
    i: [ singleSpec, specParams ]
    e: [
      before: dd.helper.f
      matcher: 'default'
      xit: 0
      mochaMethod: 'xit'
      message: 'pending: returns 21st for 21'
      input: 21
      expected: '21st'
      after: dd.helper.ff
    ]
  ]
