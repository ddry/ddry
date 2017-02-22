'use strict'

Context = require '../spec/context'
object = require '../common/object'
instance = require './instance'

module.exports =
  processInstance: instance.process

  get: (params, code) ->
    return 'Driver' if params.use
    return 'Instance' if instance.valid params, code
    return 'Function' if typeof code is 'function'
    'Module'

  getThat: (dd, name) ->
    return dd.modules[dd.path] unless dd.use
    code = dd.driverFactories[dd.path]
    dd.drivers[dd.path][name] = object.construct code, []

  parseTitle: (title, path) ->
    return title if title and typeof title is 'object'
    _ =
      title: title
      path: path

  processDriver: (dd, params, code) ->
    dd.driverFactories[dd.path] = code
    dd.drivers[dd.path] = {}
    dd.generators[dd.path] = {}

  processFunction: (dd, params, code) ->
    dd.modules[dd.path] = code
    dd.methodName = false
    dd.generators[dd.path] = new Context code, false, dd
    dd.that = dd.modules[dd.path]

  processModule: (dd, params, code) ->
    dd.modules[dd.path] = code
    dd.generators[dd.path] = {}
    dd.that = dd.modules[dd.path]

  setMethodName: (dd, name) ->
    return false if typeof dd.methodName is 'boolean'
    dd.methodName = name
    dd.that = @.getThat dd, name
    dd.generators[dd.path][name] ?= new Context dd.that, name, dd
