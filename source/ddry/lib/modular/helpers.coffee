'use strict'

folder = require '../fs/folder'
requireSafe = require '../fs/require_safe'
common = require '../common/object'

module.exports =
  addOutsideModules: (codeModules, params) ->
    return codeModules unless params.outside and typeof params.outside is 'object'
    for name, outsidePath of params.outside
      outside = @.parseOutsidePath name, outsidePath
      common.mergeHashes codeModules, outside
    codeModules

  parseOutsidePath: (name, outsidePath) ->
    return "#{name}": outsidePath unless folder.isFolder outsidePath
    folderModules = folder.read name, outsidePath
    mounted = {}
    for moduleName, modulePath of folderModules
      mounted["#{name}.#{moduleName}"] = modulePath
    mounted

  attachDDHelper: (helper) ->
    return false unless helper and typeof helper is 'object'
    return false unless typeof helper.path is 'string'
    return false unless Array.isArray helper.initial
    Helper = requireSafe helper.path
    return false unless typeof Helper is 'function'
    common.construct Helper, helper.initial

  filterHash: (hash, keys) ->
    return hash unless keys.length
    hashKeys = Object.keys hash
    filtered = {}
    for hashKey in hashKeys
      filtered[hashKey] = hash[hashKey] if hash[hashKey]? and @.match hashKey, keys
    filtered

  getFilteredList: (filesHash, params) ->
    list = Object.keys filesHash
    return list unless params and typeof params is 'object'
    params.only ?= []
    list = Object.keys @.filterHash(filesHash, params.only)
    return list unless Array.isArray params.except
    that = @
    list.filter (name) ->
      not that.match name, params.except

  match: (hashKey, keys) ->
    return true if keys.indexOf(hashKey) isnt -1
    hashKey = hashKey.split '.'
    return false if hashKey.length is 1
    xPath = []
    for node in hashKey
      xPath.push node
      return true if keys.indexOf(xPath.join '.') isnt -1
    false

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
