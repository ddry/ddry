###
# Command line interface core
###

'use strict'

commandList = require './command_list'
configurer = require './configurer'
kernel = require './kernel'

module.exports = (params) ->
  try
    if typeof process.env.DDRY_CLI is 'undefined'
      return configurer.serveSpec()
    kernel.setPrefix()
    unless params.length
      kernel.exit()
      return true
    [ command, commandParams... ] = params
    command = commandList.aliases[command] or command
    if commandList.names.indexOf(command) isnt -1
      kernel.process command, commandParams
      return true
    kernel.cliScope params
    true
  catch e
    console.log e.message
    throw new Error
