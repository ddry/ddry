'use strict'

module.exports = (dd) ->
  ddry = dd.helper.ddry()
  ddry.modular
    outside:
      module: 'spec/examples/code/lib/numbering'
  numbering = dd.helper.requireSafe 'spec/examples/code/lib/numbering'

  dd.drive
    it: 'returns stored module singleton'
    i: [ ddry, null, numbering ]
    e: numbering
