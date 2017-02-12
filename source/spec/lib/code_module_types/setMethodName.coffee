'use strict'

helper = require '../../spec_helper'
MethodContext = helper.methodContext

module.exports = (dd) ->
  ddryWithFunction = helper.dd()
  ddryWithFunction.modular
    outside:
      module: 'spec/examples/code/lib/function_export'

  dd.drive
    it: 'returns false for function module export'
    i: [ ddryWithFunction, 'name' ]
    e: false

  ddryWithModule = helper.dd()
  ddryWithModule.modular
    outside:
      module: 'spec/examples/code/lib/numbering'

  dd.drive
    it: 'sets context for module method'
    i: [ ddryWithModule, 'ordinal' ]
    e: new MethodContext  ddryWithModule.that, 'ordinal', ddryWithModule.matchers, ddryWithModule.use
