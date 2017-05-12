###
# Command line interface logger
###

'use strict'

c = require '../common/colors'
usage = require './usage'

module.exports =
  errors:
    codeFolderUndefined: ->
      'Code folder definition missing'
    configurerMissing: (path) ->
      "Failed to load configurer file from #{c.bright path}"
    configurerUndefined: ->
      "In order to omit configurer path please specify it at least once."
    empty: -> ''
    noCodeFolder: (code) ->
      "Specified code folder #{c.bright code} does not exist."
    noConfigFound: ->
      "No spec config file (#{c.bright 'ddry.json'}) found. Run 'ddry init' to create it first."
    usage: (command) ->
      usage[command]

  messages:
    configured: (p) ->
      "Config object generated by #{c.bright p.path} for '#{p.params}'"
    configSaved: (filename) ->
      "#{c.ddry()} spec configuration saved in #{c.bright filename}"
    empty: -> ''
    noTitle: (filePath) ->
      "No title defined in #{c.bright filePath}"
    titleExtracted: (p) ->
      "Extracted #{c.green p.title} from #{c.bright p.filePath}"
    unscoped: ->
      "Running spec with unscoped #{c.bright 'ddry.json'}"

  error: (alias, param, calm = false) ->
    badge = if calm then '' else c.red 'ERROR:'
    throw new Error "#{badge} #{@.errors[alias] param}"

  info: (alias, param, mockUnmute = false) ->
    mute = if mockUnmute then false else typeof process.env.DDRY_DEV is 'string'
    return "#{@.messages[alias] param}" if mute
    console.log "#{@.messages[alias] param}"
    "#{@.messages[alias] param}"
