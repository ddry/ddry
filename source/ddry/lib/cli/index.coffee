###
# Command line interface core
###

'use strict'

commands = require './commands'
object = require '../common/object'
commandNames = [ 'p', 'init', 'titles', 'config', 'add', 'rm' ] 

module.exports = (params) ->
  commands.setPrefix()
  unless params.length
    commands.exit()
    return true
  if object.match params[0], commandNames
    [ commandName, commandParams... ] = params
    commands[commandName].apply commands, commandParams
    return true
