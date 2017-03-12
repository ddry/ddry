###
# Command line interface commands
###

'use strict'

c = require '../common/colors'
error = require './error'
helpers = require './helpers'
folder = require '../fs/folder'
object = require '../common/object'

module.exports =
  cliScope: helpers.cliScope
  exit: helpers.exit
  load: helpers.load
  save: helpers.save
  setPrefix: helpers.setPrefix

  config: ->
    [ config, configPath, params ]  = helpers.fetchConfig arguments
    configFunction = require configPath
    moduleTitles = config.moduleTitles
    config = configFunction.apply configFunction, params
    config.moduleTitles = moduleTitles or helpers.moduleTitles config
    config = object.merge config,
      cli:
        config:
          path: configPath
          params: params
    helpers.save config

  init: (code, spec, title) ->
    code = helpers.stripSlash code
    unless folder.isFolder code
      return error "Specified code folder {c.bright code} does not exist." 
    spec = helpers.stripSlash spec
    config =
      title: title or code
      code: code
      spec: spec
    config.moduleTitles = helpers.moduleTitles config
    helpers.save config

  titles: ->
    config = helpers.load()
    unless typeof config.code is 'string'
      return error "Code folder definition missing" 
    config.moduleTitles = helpers.moduleTitles config
    helpers.save config
