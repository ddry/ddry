'use strict'

module.exports = (dd) ->
  errorHash = dd.helper.requireSafe 'lib/code_module_errors'
  unordered = dd.helper.mergeHashes {}, errorHash
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
