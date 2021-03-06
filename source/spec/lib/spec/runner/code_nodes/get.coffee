'use strict'

module.exports = (dd) ->
  singleton = dd.helper.examples.numbering
  dd.drive
    it: 'returns singleton code nodes if no instances found'
    i: [
      code: singleton
      instanceNames: {}
    ]
    e:
      root: singleton
      that: singleton

  instances =
    folder:
      first:
        method: dd.helper.f
  dd.drive [
    it: 'returns instance containing method if present'
    i: [
      code: instances
      instanceNames: [ 'folder.first' ]
      methodName: 'folder.first.method'
    ]
    e:
      root: instances
      that: instances.folder.first
  ,
    it: 'returns singleton code if containing instance not found'
    i: [
      code: instances
      instanceNames: [ 'folder.second' ]
      methodName: 'folder.first.method'
    ]
    e:
      root: instances
      that: instances
  ]
