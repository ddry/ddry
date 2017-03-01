'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns folder files list'
    i: [ 'spec/examples/spec' ]
    e: [
      'spec/examples/spec/muteTape/spec.js'
    ]
  ]
