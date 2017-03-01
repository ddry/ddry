'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns option if it is not falsy'
    i: [ true ]
    e: true
  ,
    before: ->
      @.moduleName = 'module'
    it: 'returns module name if required option is not set'
    i: [ false, true ]
    e: 'module'
  ]
