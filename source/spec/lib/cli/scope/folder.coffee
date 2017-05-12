'use strict'

module.exports = (dd) ->
  dd.drive [
    before: ->
      @.specPath = new RegExp "^spec/lib/"
      @.item = 'spec/lib/examples/instances/one/'
    it: 'returns spec folder name'
    i: []
    e: 'examples.instances.one'
  ,
    before: ->
      @.item = 'lib/cli/'
      @.modulePaths =
        "cli.scope": 'lib/cli/scope'
    it: 'returns code or outside folder name'
    i: []
    e: 'cli'
  ,
    before: ->
      @.item = 'lib/failing'
    it: 'returns false if folder not listed in module paths'
    i: []
    e: false
    after: ->
      delete @.item
      delete @.specPath
      delete @.modulePaths
  ]
