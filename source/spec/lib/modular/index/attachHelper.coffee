'use strict'

module.exports = (dd) ->
  ddry = dd.helper.ddry()
  Instance = dd.helper.examples.instance

  dd.drive
    it: "attaches specified helper"
    i: [ ddry, helper:
      path: 'spec/examples/code/lib/instance'
      initial: [ 'title', 'message' ]
    ]
    e: new Instance 'title', 'message'
