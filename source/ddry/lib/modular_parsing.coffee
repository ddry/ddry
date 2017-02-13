'use strict'

helpers = require './modular_helpers'
readFolderFiles = require './read_folder_files'
testEngine = require './test_engine'

module.exports =
  muteOutput: ->
    testEngine.muteOutput()

  addCustomMatchers: (dd, params) ->
    params.matchers = [ params.matchers ] if typeof params.matchers is 'string'
    return unless Array.isArray params.matchers
    customMatchers = helpers.requireMatchers params.matchers
    return unless customMatchers
    dd.matchers = helpers.mergeHashes dd.matchers, customMatchers

  attachHelper: (dd, params) ->
    dd.helper = helpers.attachDDHelper params.helper

  processModular: (dd) ->
    testEngine.modular dd

  parseModular: (dd, params) ->
    codeModules = @.initCodeModules params
    codeModules = helpers.addOutsideModules codeModules, params
    specModules = helpers.getFilteredList codeModules, params
    specModulePaths = helpers.parseSharedSpecs codeModules, params
    modules = []
    for moduleName in specModules
      moduleParams =
        title: helpers.getOption 'moduleTitles', params, moduleName
        path: codeModules[moduleName]
        methods: helpers.getOption 'methods', params, moduleName
      initial = helpers.getOption 'initial', params, moduleName
      moduleParams.initial = initial if Array.isArray initial
      moduleParams.use = helpers.getSetOption 'use', params, moduleName
      modules.push [ dd, moduleParams, specModulePaths[moduleName] ]
    modules

  initCodeModules: (params) ->
    return {} unless params.code?
    readFolderFiles(params.title, params.code)

  loadModuleSpecFolder: (dd, params, specs) ->
    methodList = readFolderFiles params.title, specs, true
    methodNames = helpers.getFilteredList methodList, params.methods
    specList = helpers.filterHash methodList, methodNames
    testEngine.runModuleSpecFolder dd, params.title, specList

  describeModule: (dd, params, specs) ->
    if params
      testEngine.describeModule dd, params, specs

  describeMethod: (dd, name, specs) ->
    if specs
      testEngine.describeMethod dd, name, specs
