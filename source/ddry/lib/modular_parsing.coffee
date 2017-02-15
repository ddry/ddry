'use strict'

helpers = require './modular_helpers'
readFolderFiles = require './read_folder_files'
testEngine = require './test_engine'

module.exports =
  addCustomMatchers: (dd, params) ->
    params.matchers = [ params.matchers ] if typeof params.matchers is 'string'
    return false unless Array.isArray params.matchers
    customMatchers = helpers.requireMatchers params.matchers
    return false unless Object.keys(customMatchers).length
    dd.matchers = helpers.mergeHashes dd.matchers, customMatchers

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
    moduleParams =
      title: helpers.getOption 'moduleTitles', params, moduleName
      path: codeModules[moduleName]
      methods: helpers.getOption 'methods', params, moduleName
    initial = helpers.getOption 'initial', params, moduleName
    moduleParams.initial = initial if Array.isArray initial
    moduleParams.use = helpers.getSetOption 'use', params, moduleName
    moduleParams

  initCodeModules: (params) ->
    return {} unless params.code?
    readFolderFiles(params.title, params.code)

  loadModuleSpecFolder: (dd, params, specs) ->
    methodList = readFolderFiles params.title, specs, true
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

  setContext: (type, title, specs) ->
    testEngine.sendOutput type, [ title, specs ]
    true
