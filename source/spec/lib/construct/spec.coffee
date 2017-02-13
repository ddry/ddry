'use strict'

module.exports = (dd) ->
  Instance = dd.helper.requireSafe 'spec/examples/code/lib/instance'

  dd.drive
    it: 'creates instance with constructor and initial values'
    i: [ Instance, [ 'title', 'message' ] ]
    e: new Instance 'title', 'message'
