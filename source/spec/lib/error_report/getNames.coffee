'use strict'

helper = require '../../spec_helper'
errorHash = helper.requireSafe 'lib/code_module_errors'

module.exports = (dd) ->
  unordered = helper.mergeHashes {}, errorHash
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
