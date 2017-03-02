'use strict'

module.exports = (dd) ->
  spec = (expected) ->
    input: [
      detectors:
        one: 1
        two: 2
        six: 6
    , false ]
    expected: expected
  specSet =
    code: dd.helper.requireSafe 'lib/common/error_report'
    instanceNames: {}
    methodName: 'getNames'
  clear =
    extra: []
    missing: []

  clearSpec = spec [ 'six', 'one', 'two' ]
  extraSpec = spec [ 'ten', 'six', 'one', 'two' ]
  missySpec = spec [ 'six', 'two' ]
  messySpec = spec [ 'ten', 'one' ]

  dd.ry
    clear:
      context: 'If arrays element sets match'
      it: 'returns clear actual'
      i: [ clearSpec, specSet ]
      e: 
        actual: clear
        expected: clear
    extra:
      context: 'If actual array contains extra elements'
      it: 'returns actual with extra elements'
      i: [ extraSpec, specSet ]
      e: 
        actual: 
          extra: [ 'ten' ]
          missing: []
        expected: clear
    missy:
      context: 'If actual array misses expected elements'
      it: 'returns actual with missing elements'
      i: [ missySpec, specSet ]
      e: 
        actual: 
          extra: []
          missing: [ 'one' ]
        expected: clear
    messy:
      context: 'If actual array is both ways different'
      it: 'returns actual with extra and missing elements'
      i: [ messySpec, specSet ]
      e: 
        actual: 
          extra: [ 'ten' ]
          missing: [ 'two', 'six' ]
        expected: clear
