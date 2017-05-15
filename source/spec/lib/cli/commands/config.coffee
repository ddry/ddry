'use strict'

module.exports = (dd) ->
  configurer = dd.helper.requireSafe 'spec/config'
  config = configurer()
  config.cli.config =
    path: '../../spec/config'
    params: ''
  delete config.moduleTitles

  dd.drive
    it: 'generates the config object with given configurer with given params'
    i: []
    e: config
