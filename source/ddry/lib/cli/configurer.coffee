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

  fetchModular: (config) ->
    return 'ddry/modular' unless object.isObject config
    return 'ddry/modular' unless object.isObject config.cli
    config.cli.ddry or 'ddry/modular'

  fetchModule: (path) ->
    try
      configurer = require.resolve path
    catch e
      configurer = false
    configurer

  fetchPrefix: (config) ->
    return false unless object.isObject config
    return false unless object.isObject config.cli
    return false unless typeof config.cli.prefix is 'string'
    config.cli.prefix

  serveSpec: (constraints, preventLoop = false) ->
    config = io.load()

    modular = @.fetchModular config
    spec = require(modular)()
    prefix = @.fetchPrefix config
    spec.setPrefix prefix if prefix

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
    return false unless object.isObject config.cli
    return false unless object.isObject config.cli.config
    true

  stripSlash: (dirName) ->
    dirName.replace /\/$/, ''
