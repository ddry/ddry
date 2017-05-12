'use strict'

module.exports = (dd) ->
  dd.drive [
    before: ->
      @.item = 'index.js'
      @.modulePaths =
        index: 'index'
    it: 'returns code module name if its path listed'
    i: []
    e: 'index'
  ,
    before: ->
      @.item = 'fail.js'
    it: 'returns false if item path is not listed'
    i: []
    e: false
    after: ->
      delete @.item
      delete @.modulePaths
  ]
