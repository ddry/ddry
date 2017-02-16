'use strict'

module.exports = (dd) ->
  Instance = dd.helper.examples.instance

  dd.drive
    it: 'creates instance with constructor and initial values'
    i: [ Instance, [ 'title', 'message' ] ]
    e: new Instance 'title', 'message'
