'use strict'

c = require '../common/colors'
commands = require './commands'
constraints = require './constraints'
log = require './log'
io = require './io'
object = require '../common/object'

noGetCommands = [ 'init', 'config' ]
noSetCommands = [ 'usage' ]

module.exports =
  cliScope: (params) ->
    scope = constraints.oe params
    cli = io.load true
    cli.constraints = constraints.render scope
    io.save cli, true

  getConfig: (command) ->
    return {} if noGetCommands.indexOf(command) isnt -1
    io.load()

  exit: ->
    if io.configPresent()
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
    return true if noSetCommands.indexOf(command) isnt -1
    io.save config

  setPrefix: ->
    if typeof process.env.DDRY_DEV is 'string'
      process.env.DDRY_PREFIX = '../../'
      return true
    npmRoot = process.env.NPM_ROOT.replace process.env.PWD, ''
    level = npmRoot.split('/').length + 4
    process.env.DDRY_PREFIX = Array(level).join '../'
    true
