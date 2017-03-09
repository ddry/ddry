###
# Command line interface helpers
###

'use strict'

attach = require '../modular/attach'
c = require '../common/colors'
folder = require '../fs/folder'
fs = require 'fs'
object = require '../common/object'
path = require 'path'
error = require './error'

module.exports =
  exit: ->
    configPresent = fs.existsSync path.join('ddry.json')
    if configPresent
      console.log "Running spec with unchanged #{c.bright 'ddry.json'}"
      return true
    error "No spec config file (#{c.bright 'ddry.json'}) found. Run 'ddry init' to create it first."

  getModuleTitles: (filesHash) ->
    titles = {}
    for name, filePath of filesHash
      titles[name] = @.getModuleTitle filePath
    titles

  getModuleTitle: (filePath) ->
    file = fs.readFileSync path.join("#{filePath}.js"), 'utf-8'
    title = file.match /\/\*\s*\*\s*([^*]*?)\s*\*/
    if Array.isArray title
      title = title[1]
      console.log "Extracted #{c.green title} from #{c.bright filePath}"
      return title
    console.log "No title defined in #{c.bright filePath}"
    filePath

  outputConfig: (filename, configObject) ->
    json = JSON.stringify configObject, null, 2
    filename = path.join filename
    fs.writeFileSync filename, json, 'utf-8'
    console.log "ddry spec configuration saved in #{c.bright filename}"

  moduleTitles: (code, config = {}) ->
    filesHash = folder.read '', code, true
    filesHash = attach.outside filesHash, config
    titles = @.getModuleTitles filesHash
    moduleTitles = {}
    for name, title of titles
      moduleTitles = object.insertKey moduleTitles, name, title
    moduleTitles

  setPrefix: ->
    if typeof process.env.DDRY_DEV is 'string'
      process.env.DDRY_PREFIX = '../../'
      return true
    npmRoot = process.env.NPM_ROOT.replace process.env.PWD, ''
    level = npmRoot.split('/').length + 4
    process.env.DDRY_PREFIX = Array(level).join '../'
    true

  stripSlash: (dirName) ->
    dirName.replace /\/$/, ''
