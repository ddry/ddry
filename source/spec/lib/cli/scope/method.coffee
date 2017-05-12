'use strict'

module.exports = (dd) ->
  dd.drive [
    before: ->
      @.item = 'failing/module/method.js'
      @.specPath = new RegExp '^spec/lib/'
    it: 'returns false for failing method'
    i: []
    e: false
  ,
    before: ->
      @.item = 'spec/lib/failing/module/method.js'
      @.methodPaths = [ 'successful.module' ]
    it: 'returns false for non-existent module'
    i: []
    e: false
  ,
    before: ->
      @.item = 'spec/lib/successful/module/'
    it: 'returns code module if found'
    i: []
    e: 'successful.module'
  ,
    before: ->
      @.item = 'spec/lib/successful/module/method.js'
    it: 'returns method of module if found'
    i: []
    e: [ 'successful.module', 'method' ]
    after: ->
      delete @.item
      delete @.methodPaths
      delete @.specPath
  ]
