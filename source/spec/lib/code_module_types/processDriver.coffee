'use strict'

module.exports = (dd) ->
  ddry = dd.helper.ddry()
  instance = dd.helper.requireSafe 'spec/examples/code/lib/instance'

  dd.drive
    it: 'returns empty generators hash'
    i: [ ddry, null, instance ]
    e: {}
