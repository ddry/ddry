'use strict'

module.exports = (dd) ->
  config =  dd.helper.io.load()
  dd.drive
    before: ->
      process.env.DDRY_PREFIX = '../../'
    it: 'returns configurer data if valid configurer path given'
    i: [ [ 'spec/config/' ] ]
    e: [ config, '../../spec/config/', [] ]


  dd.drive
    before: ->
      dd.validPath = config.cli.config.path
      config.cli.config.path = 'failing/configurer'
      dd.helper.io.save config
    matcher: 'error'
    it: 'throws `configurerMissing` error if stored config path fails'
    i: [ [] ]
    e: "#{dd.helper.c.red 'ERROR:'} Failed to load configurer file from #{dd.helper.c.bright 'failing/configurer'}"
    after: ->
      config.cli.config.path = dd.validPath
      dd.helper.io.save config
