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
  exit: helpers.exit
  setPrefix: helpers.setPrefix

  config: ->
    [ configPath, params... ] = arguments
    configFunction = require "#{process.env.DDRY_PREFIX}#{configPath}"
    config = configFunction.apply configFunction, params
    config.moduleTitles = helpers.moduleTitles config.code, config
    helpers.outputConfig 'ddry.json', config

  init: (code, spec, title) ->
    code = helpers.stripSlash code
    unless folder.isFolder code
      return error "Specified code folder {c.bright code} does not exist." 
    spec = helpers.stripSlash spec
    config =
      title: title or code
      code: code
      spec: spec
    config.moduleTitles = helpers.moduleTitles code
    helpers.outputConfig 'ddry.json', config

  titles: (code, outside = {}) ->
    codeModules = folder.read '', code, true
    titles = helpers.getModuleTitles codeModules
    moduleTitles = {}
    for name, title of titles
      moduleTitles = object.insertKey moduleTitles, name, title
    moduleTitles
