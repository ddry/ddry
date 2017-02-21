'use strict'

module.exports = (dd) ->
  singleton = dd.helper.examples.numbering
  dd.drive [
    it: 'returns singleton code nodes if no instances found'
    i: [
      code: singleton
      instanceNames: {}
    ]
    e:
      root: singleton
      that: singleton
  ]
