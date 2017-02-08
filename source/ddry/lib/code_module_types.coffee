'use strict'

MethodContext = require './method_context'

module.exports =
  construct: (constructor, args) ->
    F = ->
      constructor.apply(this, args);
    F.prototype = constructor.prototype;
    new F()

  get: (dd, params, code) ->
    return 'Driver' if params.use
    return 'Instance' if @.instanceValid params, code
    return 'Function' if typeof code is 'function'
    'Module'

  getThat: (dd, name) ->
    return dd.modules[dd.path] unless dd.use
    code = dd.driverFactories[dd.path]
    dd.drivers[dd.path][name] = @.construct code, []

  instanceValid: (params, code) ->
    Array.isArray(params.initial) and typeof code is 'function'

  parseTitle: (title, path) ->
    return title if typeof title is 'object'
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
    dd.generators[dd.path] = new MethodContext code, false, dd.matchers, dd.use
    dd.that = dd.modules[dd.path]

  processInstance: (dd, params, code) ->
    dd.modules[dd.path] = @.construct code, params.initial
    dd.generators[dd.path] = {}
    dd.that = dd.modules[dd.path]

  processModule: (dd, params, code) ->
    dd.modules[dd.path] = code
    dd.generators[dd.path] = {}
    dd.that = dd.modules[dd.path]

  setMethodName: (dd, name) ->
    return if typeof dd.methodName is 'boolean'
    dd.methodName = name
    dd.that = @.getThat dd, name
    dd.generators[dd.path][name] ?= new MethodContext dd.that, name, dd.matchers, dd.use
