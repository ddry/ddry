'use strict'

errors = require './code_module_errors'
errorReport = require './error_report'
parsing = require './modular_parsing'
requireSafe = require './require_safe'
types = require './code_module_types'

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
    @.processModuleType dd, params, code
    if typeof specs is 'string'
      parsing.loadModuleSpecFolder dd, params, specs
      return false
    params

  processModuleType: (dd, params, code) ->
    moduleType = types.get dd, params, code
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
