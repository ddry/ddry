###
# Safe require core
###

'use strict'

errorReport = require '../common/error_report'

module.exports =
  prefix: '../../../../'

  errors:
    order: [ 'loadError', 'malformedFile' ]
    detectors:
      loadError: (title, module, path) ->
        return [ title, module ] if typeof module is 'string'
        false
      malformedFile: (title, module, path) ->
        containsModule = !!Object.keys(module).length
        containsFunction = typeof module is 'function'
        return [ title, path ] unless containsModule or containsFunction
        false
    messages:
      loadError: (title, module) ->
        title: title
        messages: [ "fails to load module '#{module}'" ]
      malformedFile: (title, module) ->
        title: title
        messages: [ "contains no valid exports in '#{module}'" ]

  loadModule: (title, path) ->
    module = @.requireModule path
    return false if errorReport.toTestEngine @.errors, [ title, module, path ]
    module

  requireModule: (path) ->
    local = @.tryRequire "#{@.prefix}#{path}"
    return local if typeof local isnt 'string'
    packaged = @.tryRequire path

  setPrefix: (prefix) ->
    @.prefix = prefix

  tryRequire: (path) ->
    try
      module = require path
      return module
    catch e
      return path
