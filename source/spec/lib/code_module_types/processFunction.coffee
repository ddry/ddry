'use strict'

helper = require '../../spec_helper'

ddry = helper.dd()
ddry.modular
  outside:
    module: 'spec/examples/code/lib/function_export'

singleton = helper.requireSafe 'spec/examples/code/lib/function_export'

module.exports = (dd) ->
  dd.drive
    it: 'returns stored function singleton'
    i: [ ddry, null, singleton ]
    e: singleton
