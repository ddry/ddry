'use strict'

fs = require 'fs'
path = require 'path'

readFolderFiles = require './read_folder_files'
requireSafe = require './require_safe'
common = require './common'

module.exports =
  addOutsideModules: (codeModules, params) ->
    return codeModules unless params.outside and typeof params.outside is 'object'
    for name, outsidePath of params.outside
      outside = @.parseOutsidePath name, outsidePath
      common.mergeHashes codeModules, outside
    codeModules

  parseOutsidePath: (name, outsidePath) ->
    return "#{name}": outsidePath unless @.isFolder outsidePath
    folderModules = readFolderFiles name, outsidePath
    mounted = {}
    for moduleName, modulePath of folderModules
      mounted["#{name}.#{moduleName}"] = modulePath
    mounted

  isFolder: (dir) ->
    try
      folder = fs.lstatSync(path.join dir).isDirectory()
    catch e
      folder = false
    folder

  attachDDHelper: (helper) ->
    return false unless helper and typeof helper is 'object'
    return false unless typeof helper.path is 'string'
    return false unless Array.isArray helper.initial
    Helper = requireSafe helper.path
    return false unless typeof Helper is 'function'
    common.construct Helper, helper.initial

  filterHash: (hash, keys) ->
    filtered = {}
    for key in keys
      filtered[key] = hash[key] if hash[key]?
    filtered

  getFilteredList: (filesHash, params) ->
    list = Object.keys filesHash
    return list unless params and typeof params is 'object'
    return Object.keys @.filterHash(filesHash, params.only) if params.only
    return list unless params.except
    list = list.filter (name) ->
      params.except.indexOf(name) is -1

  parseSharedSpecs: (filesHash, params) ->
    moduleNames = Object.keys(filesHash)
    specPaths = {}
    for moduleName in moduleNames
      modulePath = moduleName.split('.').join '/'
      specPaths[moduleName] = "#{params.spec}/#{modulePath}"
    return specPaths unless params.shareSpecs and typeof params.shareSpecs is 'object'
    for sharedSpecFolder, sharingModules of params.shareSpecs
      for module in sharingModules
        if typeof specPaths[module] is 'string'
          specPaths[module] = "#{params.spec}/#{sharedSpecFolder}"
    specPaths

  requireMatchers: (pathsArray) ->
    matchers = {}
    for matcherPath in pathsArray
      matcher = requireSafe matcherPath
      if matcher
        common.mergeHashes matchers, matcher
    matchers
