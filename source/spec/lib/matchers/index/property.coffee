'use strict'

module.exports = (dd) ->
  example = dd.helper.requireSafe 'spec/examples/code/properties'
  code = dd.helper.extend {}, example
  spec =
    input: [ 1 ]
    expected:
      few: 1
      many: 10
  specSet =
    code: code
    root: code
    that: code 
    instanceNames: {}
    methodName: 'setFew'

  dd.drive
    it: 'asserts expected module properties'
    i: [ spec, specSet ]
    e:
      actual:
        few: 1
        many: undefined
      expected: spec.expected
