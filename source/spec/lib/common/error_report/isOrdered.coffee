'use strict'

module.exports = (dd) ->
  errorHash = dd.helper.requireSafe 'lib/code/errors'
  unordered = dd.helper.extend {}, errorHash
  delete unordered.order

  dd.drive [
    it: "returns false for independent error conditions"
    i: [ unordered ]
    e: false
  ,
    it: "returns true if guard clause order specified"
    i: [ errorHash ]
    e: true
  ]
