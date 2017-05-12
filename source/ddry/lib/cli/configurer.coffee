###
# Command line interface helpers
###

'use strict'

io = require './io'
object = require '../common/object'
log = require './log'

module.exports =
  load: io.load

  explainOmitting: (config, givenConfigurerPath) ->
    return true if @.stored(config) and typeof config.cli.config.path is 'string'
    if typeof givenConfigurerPath is 'string'
      log.error 'configurerMissing', givenConfigurerPath
    log.error 'configurerUndefined'

  fetch: (args) ->
    config = io.load()
    [ givenConfigurerPath, params... ] = args
    configurerPath = "#{process.env.DDRY_PREFIX}#{givenConfigurerPath}"
    configurer = @.fetchModule configurerPath
    return [ config, configurerPath, params ] if configurer
    @.explainOmitting config, givenConfigurerPath
    configurerPath = config.cli.config.path
    configurer = @.fetchModule configurerPath
    unless configurer
      log.error 'configurerMissing', configurerPath
    [ params... ] = args
    [ config, configurerPath, params ]

  fetchModule: (path) ->
    try
      configurer = require.resolve path
    catch e
      configurer = false
    configurer

  serveSpec: (constraints, preventLoop = false) ->
    config = io.load()

    modular = config.cli.ddry or 'ddry/modular'
    spec = require(modular)()
    spec.setPrefix config.cli.prefix if config.cli.prefix

    if @.stored config
      savedConfig = config
      configurer = require config.cli.config.path
      loadedConfig = configurer.apply configurer, config.cli.config.params
      config = object.merge savedConfig, loadedConfig
    if constraints and typeof constraints is 'object'
      config = object.merge config, constraints
    spec.apply config unless preventLoop
    true

  stored: (config) ->
    return false unless config.cli and typeof config.cli is 'object'
    return false unless config.cli.config and typeof config.cli.config is 'object'
    true

  stripSlash: (dirName) ->
    dirName.replace /\/$/, ''
