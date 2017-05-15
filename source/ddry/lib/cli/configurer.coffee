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
    configurerPath = @.fetchModule config.cli.config.path
    unless configurerPath
      log.error 'configurerMissing', configurerPath
    [ params... ] = args
    [ config, configurerPath, params ]

  fetchModular: (config) ->
    return 'ddry/modular' unless object.isObject config
    return 'ddry/modular' unless object.isObject config.cli
    config.cli.ddry or 'ddry/modular'

  fetchModule: (path) ->
    try
      require.resolve path
      return path
    catch e
      unprefixed = path.replace /\.\.\//g, ''
      try
        fallbackPath = "../../#{unprefixed}"
        require.resolve fallbackPath
        return fallbackPath
      catch e
        return false

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
      configurer = @.fetchModule config.cli.config.path
      configurer = require configurer
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
