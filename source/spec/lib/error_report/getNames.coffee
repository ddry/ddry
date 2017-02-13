'use strict'

module.exports = (dd) ->
  errorHash = dd.helper.requireSafe 'lib/code_module_errors'
  unordered = dd.helper.mergeHashes {}, errorHash
  delete unordered.order

  dd.drive [
    matcher: 'anyOrder'
    it: "returns unordered condition keys"
    i: [ unordered ]
    e: [ 'methodNotDefined', 'modulePropertiesError', 'noModuleContext' ]
  ,
    it: "returns guard clause conditions order"
    i: [ errorHash ]
    e: [ 'noModuleContext', 'modulePropertiesError', 'methodNotDefined' ]
  ]