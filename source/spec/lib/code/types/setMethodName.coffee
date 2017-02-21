'use strict'

module.exports = (dd) ->
  MethodContext = dd.helper.methodContext

  ddryWithFunction = dd.helper.ddry()
  ddryWithFunction.modular
    outside:
      module: 'spec/examples/code/function_export'

  dd.drive
    it: 'returns false for function module export'
    i: [ ddryWithFunction, 'name' ]
    e: false

  ddryWithModule = dd.helper.ddry()
  ddryWithModule.modular
    outside:
      module: 'spec/examples/code/numbering'

  dd.drive
    it: 'sets context for module method'
    i: [ ddryWithModule, 'ordinal' ]
    e: new MethodContext ddryWithModule.that, 'ordinal', ddryWithModule
