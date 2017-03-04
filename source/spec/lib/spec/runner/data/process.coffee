'use strict'

module.exports = (dd) ->
  code = dd.helper.requireSafe 'spec/examples/code/numbering'
  specParams =
    code: code
    root: code
    that: code
    instanceNames: {}
    methodName: 'ordinal'
    mochaMethod: 'it'
  singleSpec =
    it: 'returns 21st for 21'
    i: [ 21 ]
    e: '21st'
  sequenceSpec =
    it: (i, e) -> "returns #{e} for #{i}"
    data: [ '101st', '102nd', '103rd' ]
    from: 101

  expected = (data) ->
    data.map (element) ->
      code: code
      root: code
      that: code
      instanceNames: {}
      methodName: 'ordinal'
      message: "returns #{element.e} for #{element.i}"
      mochaMethod: 'it'
      input: [ element.i ]
      expected: element.e
  data =
    single: [
      i: 21
      e: '21st' ]
    sequence: [
      i: 101
      e: '101st'
    ,
      i: 102
      e: '102nd'
    ,
      i: 103
      e: '103rd'
    ]

  dd.ry
    single:
      context: 'If single spec given'
      it: 'generates single assertion data'
      i: [ singleSpec, specParams ]
      e: expected data.single
    sequence:
      context: 'If sequence spec given'
      it: 'generates sequence assertion data'
      i: [ sequenceSpec, specParams ]
      e: expected data.sequence
