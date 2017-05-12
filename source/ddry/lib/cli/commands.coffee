###
# Command line interface commands
###

'use strict'

blank =
  '[]': []
  '{}': {}

commandList = require './command_list'
constraints = require './constraints'
dotted = require '../common/dotted'
configurer = require './configurer'
folder = require '../fs/folder'
log = require './log'
object = require '../common/object'

module.exports =
  add: (config, key, value) ->
    value = blank[value] or value
    object.insertKey config, key, value

  addScope: ->
    [ config, params... ] = arguments
    scope = constraints.oe params
    scope = constraints.render scope
    object.merge config, scope

  config: ->
    [ _, configParams... ] = arguments
    [ config, configurerPath, params ] = configurer.fetch configParams
    configurerModule = require configurerPath
    config = configurerModule.apply configurerModule, params
    log.info 'configured',
      path: configurerPath
      params: params
    object.merge config,
      cli:
        config:
          path: configurerPath
          params: params

  e: ->
    log.error 'empty', null, true

  init: (config, code, spec, title) ->
    code = configurer.stripSlash code
    unless folder.isFolder code
      return log.error 'noCodeFolder', code 
    spec = configurer.stripSlash spec
    config =
      title: title or code
      code: code
      spec: spec
    config

  remove: (config, key, value) ->
    if value?
      node = dotted.parse config, key
      return config unless Array.isArray node
      property = node.indexOf value
      return config if property is -1
      key = "#{key}.#{property}"
    [ node, property, xPath ] = dotted.parse config, key, true, true
    unless Array.isArray node
      delete node[property]
      return config
    node = node.filter (e) ->
      e isnt node[property]
    nodePath = xPath.join '.'
    config = @.remove config, nodePath
    object.insertKey config, nodePath, node
    config

  removeScope: ->
    [ config, params... ] = arguments
    scope = constraints.oe params
    scope = constraints.render scope
    scope = object.report scope, true
    for constraint, subjects of scope
      subjects = object.toArray subjects
      for subject in subjects
        config = @.remove config, constraint, subject
    config

  usage: (_, command) ->
    command = commandList.aliases[command] or command
    command = if commandList.names.indexOf(command) isnt -1 then command else 'brief'
    log.error 'usage', command, true

  titles: (config) ->
    config
