'use strict'

helper = require '../../spec_helper'

ddry = helper.dd()
ddry.modular
  outside:
    module: 'spec/examples/code/lib/instance'

Instance = helper.requireSafe 'spec/examples/code/lib/instance'

module.exports = (dd) ->
  dd.drive
    matcher: 'expectFunction'
    it: 'returns stored constructor instance'
    i: [ ddry,
      initial: [ 'title', 'message' ]
    , Instance ]
    e: new Instance 'title', 'message'
