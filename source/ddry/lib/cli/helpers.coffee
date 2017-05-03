###
# Command line interface helpers
###

'use strict'

attach = require '../modular/attach'
folder = require '../fs/folder'
io = require './io'
object = require '../common/object'
log = require './log'

module.exports =
  load: io.load

  configurerStored: (config) ->
    return false unless config.cli and typeof config.cli is 'object'
    return false unless config.cli.config and typeof config.cli.config is 'object'
    true

  explainConfigurerPathOmitting: (config, givenConfigurerPath) ->
    return if @.configurerStored(config) and typeof config.cli.config.path is 'string'
    if typeof givenConfigurerPath is 'string'
      log.error 'configurerMissing', givenConfigurerPath
    log.error 'configurerUndefined'

  fetchConfigurer: (args) ->
    config = io.load()
    [ givenConfigurerPath, params... ] = args
    configurerPath = "#{process.env.DDRY_PREFIX}#{givenConfigurerPath}"
    configurer = @.fetchConfigurerModule configurerPath
    return [ config, configurerPath, params ] if configurer
    @.explainConfigurerPathOmitting config, givenConfigurerPath
    configurerPath = config.cli.config.path
    configurer = @.fetchConfigurerModule configurerPath
    unless configurer
      log.error 'configurerMissing', configurerPath
    [ params... ] = args
    [ config, configurerPath, params ]

  fetchConfigurerModule: (path) ->
    try
      configurer = require.resolve path
    catch e
      configurer = false
    configurer

  getModuleTitles: (filesHash) ->
    titles = {}
    for name, filePath of filesHash
      titles[name] = @.getModuleTitle filePath
    titles

  getModuleTitle: (filePath) ->
    file = io.readFile filePath
    title = file.match /\/\*\s*\*\s*([^*]*?)\s*\*/
    if Array.isArray title
      title = title[1]
      log.info 'titleExtracted',
        title: title
        filePath: filePath
      return title
    log.info 'noTitle', filePath
    filePath

  moduleTitles: (config) ->
    filesHash = folder.read '', config.code, true
    filesHash = attach.outside filesHash, config
    io.save
      modulePaths: filesHash
    , true
    titles = @.getModuleTitles filesHash
    moduleTitles = {}
    for name, title of titles
      moduleTitles = object.insertKey moduleTitles, name, title
    moduleTitles

  serveSpec: (constraints) ->
    config = io.load()

    modular = config.cli.ddry or 'ddry/modular'
    spec = require(modular)()
    spec.setPrefix config.cli.prefix if config.cli.prefix

    if @.configurerStored config
      savedConfig = config
      configurer = require config.cli.config.path
      loadedConfig = configurer.apply configurer, config.cli.config.params
      config = object.merge savedConfig, loadedConfig
    if constraints and typeof constraints is 'object'
      config = object.merge config, constraints
    spec.apply config

  stripSlash: (dirName) ->
    dirName.replace /\/$/, ''
