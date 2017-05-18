###
# Command line interface I/O module
###

'use strict'

c = require '../common/colors'
fs = require 'fs'
log = require './log'
path = require 'path'

module.exports =
  configPresent: ->
    fs.existsSync path.join('ddry.json')

  load: (commandLine = false) ->
    filename = if commandLine then "#{process.env.DDRY_CLI}on" else 'ddry.json'
    try
      config = fs.readFileSync path.join(filename), 'utf-8'
      config = JSON.parse config
    catch e
      config = {}
    config

  readFile: (filePath) ->
    fs.readFileSync path.join("#{filePath}.js"), 'utf-8'

  save: (configObject, commandLine = false) ->
    filename = if commandLine then "#{process.env.DDRY_CLI}on" else 'ddry.json'
    json = JSON.stringify configObject, null, 2
    filename = path.join filename
    fs.writeFileSync filename, json, 'utf-8'
    log.info 'configSaved', filename
