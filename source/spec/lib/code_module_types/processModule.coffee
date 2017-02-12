'use strict'

helper = require '../../spec_helper'

ddry = helper.dd()
ddry.modular
  outside:
    module: 'spec/examples/code/lib/numbering'

numbering = helper.requireSafe 'spec/examples/code/lib/numbering'

module.exports = (dd) ->
  dd.drive
    it: 'returns stored module singleton'
    i: [ ddry, null, numbering ]
    e: numbering
