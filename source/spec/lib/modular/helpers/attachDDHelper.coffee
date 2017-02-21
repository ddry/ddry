'use strict'

module.exports = (dd) ->
  Instance = dd.helper.examples.instance

  dd.drive [
    it: 'returns false if null given'
    i: [ null ]
    e: false
  ,
    it: 'returns false if helper path is not specified'
    i: [ {} ]
    e: false
  ,
    it: 'returns false if helper initial values are invalid'
    i: [
      path: 'helper/path'
      initial: null
    ]
    e: false
  ,
    it: 'returns false if helper path invalid'
    i: [
      path: 'helper/path'
      initial: [ 'initial' ]
    ]
    e: false
  ,
    it: 'returns false if helper module exports object'
    i: [
      path: 'spec/examples/code/numbering'
      initial: [ 'initial' ]
    ]
    e: false
  ,
    it: 'returns helper instance with initial values'
    i: [
      path: 'spec/examples/code/instance'
      initial: [ 'title', 'message' ]
    ]
    e: new Instance 'title', 'message'
  ]
