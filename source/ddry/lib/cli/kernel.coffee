###
# Command line interface kernel
###

'use strict'

c = require '../common/colors'
commands = require './commands'
constraints = require './constraints'
log = require './log'
io = require './io'
object = require '../common/object'
titles = require './titles'

groups =
  noGet: [ 'init', 'config' ]
  noSet: [ 'usage' ]
  titles: [ 'init', 'config', 'titles' ]

module.exports =
  cliScope: (params) ->
    scope = constraints.oe params
    cli = io.load true
    cli.constraints = constraints.render scope
    io.save cli, true
    true

  getConfig: (command) ->
    return {} if groups.noGet.indexOf(command) isnt -1
    io.load()

  getTitles: (config, command) ->
    return config unless groups.titles.indexOf(command) isnt -1
    config.moduleTitles = titles.get config
    config

  exit: (mockNoConfig = false) ->
    configPresent = if mockNoConfig then false else io.configPresent()
    if configPresent
      log.info 'unscoped'
      cli = io.load true
      delete cli.constraints
      io.save cli, true
      return true
    log.error 'noConfigFound'

  process: (command, params) ->
    config = @.getConfig command
    params.unshift config
    @.setConfig command, params

  setConfig: (command, params) ->
    config = commands[command].apply(commands, params)
    config = @.getTitles config, command
    unless groups.noSet.indexOf(command) isnt -1
      io.save config
      true

  setPrefix: (dev, npmRoot = 'node_modules') ->
    if typeof dev is 'string'
      return '../../'
    npmRoot = npmRoot.replace process.env.PWD, ''
    level = npmRoot.split('/').length + 4
    Array(level).join '../'
