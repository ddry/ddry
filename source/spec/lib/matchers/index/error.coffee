'use strict'

module.exports = (dd) ->
  code = dd.helper
  specSet =
    code: code
    root: code
    that: code
    instanceNames: {}
    methodName: 'oops'
  spec =
    input: []
    expected: 'oops!'

  dd.drive [
    it: 'returns thrown error message'
    i: [ spec, specSet ]
    e:
      actual: 'oops!'
      expected: 'oops!'
  ]
