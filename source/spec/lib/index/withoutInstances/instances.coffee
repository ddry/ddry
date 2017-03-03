'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns empty object if current module instances object not defined'
    i: []
    e: {}
  ,
    before: ->
      @.path = 'path'
      @.instancesList.path = {}
    it: 'returns empty object if current module has no instances'
    i: []
    e: {}
  ]
