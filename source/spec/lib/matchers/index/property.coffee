'use strict'

module.exports = (dd) ->
  example = dd.helper.requireSafe 'spec/examples/code/properties'
  spec =
    input: [ 1 ]
    expected:
      few: 1
      many: 10
  specSet =
    code: dd.helper.extend {}, example
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
