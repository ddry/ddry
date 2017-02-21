'use strict'

errors = require './errors'
errorReport = require '../common/error_report'
modular = require '../modular'
requireSafe = require '../fs/require_safe'
types = require './types'

module.exports =
  load: (dd, title, specs) ->
    params = types.parseTitle title, dd.path
    code = requireSafe params
    delete dd.methodName
    unless code
      delete dd.path
      delete dd.that
      return false
    dd.path = params.path
    dd.title = params.title
    dd.use = params.use
    dd.titles[dd.path] = params.title
    dd.specs[dd.path] = {}
    dd.instances = {}
    @.processModuleType dd, params, code
    if typeof specs is 'string'
      modular.loadModuleSpecFolder dd, params, specs
      return false
    params

  processModuleType: (dd, params, code) ->
    moduleType = types.get params, code
    types["process#{moduleType}"] dd, params, code

  setMethod: (dd, name, specs) ->
    return false if errorReport.toTestEngine errors, [ dd.title, dd.that, name, dd.use ]
    if typeof specs is 'string'
      specs = requireSafe
        title: "#{name}() of #{dd.title}"
        path: specs
      return false unless specs
    dd.specs[dd.path][name] = specs
    types.setMethodName dd, name
    specs
