'use strict'

module.exports = (dd) ->
  ddry = dd.helper.ddry()
  ddry.modular
    outside:
      module: 'spec/examples/code/lib/function_export'
  singleton = dd.helper.requireSafe 'spec/examples/code/lib/function_export'

  dd.drive
    it: 'returns stored function singleton'
    i: [ ddry, null, singleton ]
    e: singleton
