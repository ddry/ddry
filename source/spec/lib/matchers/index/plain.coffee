'use strict'

module.exports = (dd) ->
  spec =
    input: 1
    expected: 1

  dd.drive
    it: 'makes plain assertion'
    i: [ spec, null ]
    e:
      actual: 1
      expected: 1
