'use strict'

module.exports = (dd) ->
  config =
    code: 'spec/examples/spec/muteTape'

  dd.drive [
    it: 'returns unchanged config if command does not get titles'
    i: [ 'config', 'add' ]
    e: 'config'
  ,
    before: ->
      dd.cli = dd.helper.io.load true
    it: 'parses the code folder for module titles'
    i: [ config, 'titles' ]
    e:
      code: 'spec/examples/spec/muteTape'
      moduleTitles:
        spec: 'spec/examples/spec/muteTape/spec'
    after: ->
      dd.helper.io.save dd.cli, true
  ]
