###
# Command line interface core
###

'use strict'

commands = require './commands'
object = require '../common/object'
commandNames = [ 'c', 'config', 'i', 'init', 't', 'titles', 'add', 'rm' ] 

commands.c = commands.config
commands.i = commands.init
commands.t = commands.titles

module.exports = (params) ->
  commands.setPrefix()
  unless params.length
    commands.exit()
    return true
  if object.match params[0], commandNames
    [ commandName, commandParams... ] = params
    commands[commandName].apply commands, commandParams
    return true
  commands.cliScope params
