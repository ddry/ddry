'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns unchanged config if command does not get titles'
    i: [ 'config', 'add' ]
    e: 'config'
  ,
    matcher: 'error'
    it: 'throws `codeFolderUndefined` error if code folder path not found in config'
    i: [ {}, 'titles' ]
    e: "#{dd.helper.c.red 'ERROR:'} Code folder definition missing"
  ]

  config =
    code: 'spec/examples/spec/muteTape'
  dd.drive [
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
