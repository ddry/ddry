'use strict'

module.exports = (dd) ->
  ddry = dd.helper.ddry()
  ddry.modular
    outside:
      module: 'spec/examples/code/lib/instance'

  Instance = dd.helper.requireSafe 'spec/examples/code/lib/instance'

  dd.drive
    it: 'returns stored constructor instance'
    i: [ ddry,
      initial: [ 'title', 'message' ]
    , Instance ]
    e: new Instance 'title', 'message'
