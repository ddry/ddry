###
# Command line interface helpers
###

'use strict'

attach = require '../modular/attach'
c = require '../common/colors'
cliScope = require './scope'
folder = require '../fs/folder'
fs = require 'fs'
object = require '../common/object'
path = require 'path'
error = require './error'

module.exports =
  cliScope: (params) ->
    scope = cliScope.oe params
    cli = @.load true
    modulePaths = cli.modulePaths
    methodPaths = object.toArray modulePaths
    config = @.load()
    config =
      code: config.code
      spec: config.spec
    specPath = new RegExp "^#{config.spec}/"
    constraints = {}
    for mode, items of scope
      for item in items
        detect = cliScope.detect item, config, modulePaths, methodPaths, specPath
        if detect
          constraint = cliScope.key mode, detect
          object.insertKey constraints, constraint.key, constraint.value
    cli.constraints = constraints
    @.save cli, true

  exit: ->
    configPresent = fs.existsSync path.join('ddry.json')
    if configPresent
      console.log "Running spec with unchanged #{c.bright 'ddry.json'}"
      cli = @.load true
      delete cli.constraints
      @.save cli, true
      return true
    error "No spec config file (#{c.bright 'ddry.json'}) found. Run 'ddry init' to create it first."

  fetchConfig: (args) ->
    config = @.load()
    [ configPath, params... ] = args
    configPath = "#{process.env.DDRY_PREFIX}#{configPath}"
    configFunction = @.fetchConfigFunction configPath
    return [ config, configPath, params ] if configFunction
    unless typeof config.cli.config.path is 'string'
      error "Failed to load config function file from #{c.bright configPath}"
    configPath = config.cli.config.path
    configFunction = @.fetchConfigFunction configPath
    unless configFunction
      error "Failed to load config function file from #{c.bright configPath}"
    [ params... ] = args
    [ config, configPath, params ]

  fetchConfigFunction: (path) ->
    try
      configFunction = require.resolve path
    catch e
      configFunction = false
    configFunction

  getConfigFunction: (path) ->
    require path

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

  load: (commandLine = false) ->
    filename = if commandLine then "#{process.env.DDRY_CLI}on" else 'ddry.json'
    try
      config = fs.readFileSync path.join(filename), 'utf-8'
      config = JSON.parse config
    catch e
      config = {}
    config

  moduleTitles: (config) ->
    filesHash = folder.read '', config.code, true
    filesHash = attach.outside filesHash, config
    @.save
      modulePaths: filesHash
    , true
    titles = @.getModuleTitles filesHash
    moduleTitles = {}
    for name, title of titles
      moduleTitles = object.insertKey moduleTitles, name, title
    moduleTitles

  save: (configObject, commandLine = false) ->
    filename = if commandLine then "#{process.env.DDRY_CLI}on" else 'ddry.json'
    json = JSON.stringify configObject, null, 2
    filename = path.join filename
    fs.writeFileSync filename, json, 'utf-8'
    console.log "ddry spec configuration saved in #{c.bright filename}"

  serveSpec: (constraints) ->
    config = @.load()

    modular = config.cli.ddry or 'ddry/modular'
    spec = require(modular)()
    spec.setPrefix config.cli.prefix if config.cli.prefix

    if config.cli.config and typeof config.cli.config is 'object'
      moduleTitles = config.moduleTitles
      configFunction = @.getConfigFunction config.cli.config.path
      config = configFunction.apply configFunction, config.cli.config.params
      config.moduleTitles = moduleTitles
    if constraints and typeof constraints is 'object'
      config = object.merge config, constraints
    spec.apply config

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
