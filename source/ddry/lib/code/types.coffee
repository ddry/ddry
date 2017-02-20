'use strict'

construct = require('../common/object').construct
Context = require '../spec/context'

module.exports =
  codeThat: (dd, name) ->
    that = dd.modules[dd.path]
    return that unless typeof dd.constructors[dd.path] is 'function'
    name = name.split '.'
    return that if name.length is 1
    constructor = dd.constructors[dd.path]
    instance = that[name[0]]
    return instance if instance instanceof constructor
    that

  get: (params, code) ->
    return 'Driver' if params.use
    return 'Instance' if @.instanceValid params, code
    return 'Function' if typeof code is 'function'
    'Module'

  getThat: (dd, name) ->
    return @.codeThat dd, name unless dd.use
    code = dd.driverFactories[dd.path]
    dd.drivers[dd.path][name] = construct code, []

  instanceValid: (params, code) ->
    return false unless typeof code is 'function'
    return true if Array.isArray params.initial
    return false unless params.initial and typeof params.initial is 'object'
    for key, value of params.initial
      return false unless Array.isArray value
    true

  parseInitial: (code, initials) ->
    return construct code, initials if Array.isArray initials
    instances = {}
    for instanceName, initial of initials
      instances[instanceName] = construct code, initial
    instances

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

  processInstance: (dd, params, code) ->
    dd.modules[dd.path] = @.parseInitial code, params.initial
    dd.constructors[dd.path] = code
    dd.generators[dd.path] = {}
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
