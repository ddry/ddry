'use strict'

attach = require './attach'
options = require './options'
helpers = require './helpers'
object = require '../common/object'
folders = require './folders'
testEngine = require '../test/engine'

module.exports =
  addCustomMatchers: (dd, params) ->
    params.matchers = [ params.matchers ] if typeof params.matchers is 'string'
    return false unless Array.isArray params.matchers
    customMatchers = attach.matchers params.matchers
    return false unless Object.keys(customMatchers).length
    dd.matchers = object.mergeHashes dd.matchers, customMatchers

  attachHelper: (dd, params) ->
    dd.helper = attach.helper params.helper

  describeMethod: (dd, name, specs) ->
    return false unless specs
    testEngine.describeMethod dd, name, specs
    true

  describeModule: (dd, params, specs) ->
    return false unless params
    testEngine.describeModule dd, params, specs
    true

  loadModuleSpecFolder: (dd, params, specs) ->
    methodList = folders.read params.title, specs, true
    methodNames = helpers.getFilteredList methodList, params.methods
    specList = helpers.filterHash methodList, methodNames
    testEngine.runModuleSpecFolder dd, params.title, specList
    true

  muteOutput: ->
    testEngine.muteOutput()

  parseModular: (dd, params) ->
    codeModules = folders.initCodeModules params
    codeModules = attach.outside codeModules, params
    specModules = helpers.getFilteredList codeModules, params
    specModulePaths = helpers.parseSharedSpecs codeModules, params
    modules = []
    for moduleName in specModules
      moduleParams = options.getModuleParams codeModules, moduleName, params
      modules.push [ dd, moduleParams, specModulePaths[moduleName] ]
    modules

  processModular: (dd) ->
    testEngine.modular dd

  setContext: (harness, type, title, specs) ->
    testEngine.sendOutput harness, type, [ title, specs ]
    true
