'use strict'

options = require './options'
helpers = require './helpers'
mergeHashes = require('../common/object').mergeHashes
folder = require '../fs/folder'
testEngine = require '../test/engine'

module.exports =
  addCustomMatchers: (dd, params) ->
    params.matchers = [ params.matchers ] if typeof params.matchers is 'string'
    return false unless Array.isArray params.matchers
    customMatchers = helpers.requireMatchers params.matchers
    return false unless Object.keys(customMatchers).length
    dd.matchers = mergeHashes dd.matchers, customMatchers

  attachHelper: (dd, params) ->
    dd.helper = helpers.attachDDHelper params.helper

  describeModule: (dd, params, specs) ->
    return false unless params
    testEngine.describeModule dd, params, specs
    true

  describeMethod: (dd, name, specs) ->
    return false unless specs
    testEngine.describeMethod dd, name, specs
    true

  getModuleParams: (codeModules, moduleName, params) ->
    options.collect params, moduleName,
      path: codeModules[moduleName]
      , [ 'title:moduleTitles'
          'methods'
          'initial'
          [ 'use' ] ]

  initCodeModules: (params) ->
    return {} unless params.code?
    folder.read params.title, params.code, true

  loadModuleSpecFolder: (dd, params, specs) ->
    methodList = folder.read params.title, specs, true
    methodNames = helpers.getFilteredList methodList, params.methods
    specList = helpers.filterHash methodList, methodNames
    testEngine.runModuleSpecFolder dd, params.title, specList
    true

  muteOutput: ->
    testEngine.muteOutput()

  parseModular: (dd, params) ->
    codeModules = @.initCodeModules params
    codeModules = helpers.addOutsideModules codeModules, params
    specModules = helpers.getFilteredList codeModules, params
    specModulePaths = helpers.parseSharedSpecs codeModules, params
    modules = []
    for moduleName in specModules
      moduleParams = @.getModuleParams codeModules, moduleName, params
      modules.push [ dd, moduleParams, specModulePaths[moduleName] ]
    modules

  processModular: (dd) ->
    testEngine.modular dd

  setContext: (harness, type, title, specs) ->
    testEngine.sendOutput harness, type, [ title, specs ]
    true
