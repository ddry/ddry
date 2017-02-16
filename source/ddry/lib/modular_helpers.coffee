'use strict'

requireSafe = require './require_safe'
construct = require './construct'

module.exports =
  addOutsideModules: (codeModules, params) ->
    return codeModules unless params.outside and typeof params.outside is 'object'
    for name, path of params.outside
      codeModules[name] ?= path
    codeModules

  attachDDHelper: (helper) ->
    return false unless helper and typeof helper is 'object'
    return false unless typeof helper.path is 'string'
    return false unless Array.isArray helper.initial
    Helper = requireSafe helper.path
    return false unless typeof Helper is 'function'
    construct Helper, helper.initial

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

  mergeHashes: (lo, hi) ->
    for key, value of hi
      lo[key] = value
    lo

  parseSharedSpecs: (filesHash, params) ->
    moduleNames = Object.keys(filesHash)
    specPaths = {}
    for moduleName in moduleNames
      specPaths[moduleName] = "#{params.spec}/#{moduleName}"
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
        @.mergeHashes matchers, matcher
    matchers
