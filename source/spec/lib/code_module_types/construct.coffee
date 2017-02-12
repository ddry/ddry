'use strict'

helper = require '../../spec_helper'

Instance = helper.requireSafe 'spec/examples/code/lib/instance'

module.exports = (dd) ->
  dd.drive
    it: 'creates instance with constructor and initial values'
    i: [ Instance, [ 'title', 'message' ] ]
    e: new Instance 'title', 'message'
