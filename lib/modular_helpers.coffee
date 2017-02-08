'use strict'

requireSafe = require './require_safe'

module.exports =
  addOutsideModules: (codeModules, params) ->
    return codeModules unless typeof params.outside is 'object'
    for name, path of params.outside
      codeModules[name] ?= path
    codeModules

  filterHash: (hash, keys) ->
    filtered = {}
    for key in keys
      filtered[key] = hash[key]
    filtered

  getFilteredList: (filesHash, params) ->
    list = Object.keys filesHash
    return list unless typeof params is 'object'
    return params.only if params.only
    return list unless params.except
    list = list.filter (name) ->
      params.except.indexOf(name) is -1

  getOption: (option, params, name) ->
    return name unless params[option]
    return name unless params[option][name]
    params[option][name]

  getSetOption: (option, params, name) ->
    return false unless Array.isArray params[option]
    params[option].indexOf(name) isnt -1

  mergeHashes: (lo, hi) ->
    for key, value of hi
      lo[key] = value
    lo

  parseSharedSpecs: (filesHash, params) ->
    moduleNames = Object.keys(filesHash)
    specPaths = {}
    for moduleName in moduleNames
      specPaths[moduleName] = "#{params.spec}/#{moduleName}"
    return specPaths unless typeof params.shareSpecs is 'object'
    for sharedSpecFolder, sharingModules of params.shareSpecs
      for module in sharingModules
        if typeof specPaths[module] is 'string'
          specPaths[module] = "#{params.spec}/#{sharedSpecFolder}"
    specPaths

  requireMatchers: (pathsArray) ->
    matchers = {}
    for matcherPath in pathsArray
      matcher = requireSafe
        title: matcherPath
        path: matcherPath
      if matcher
        @.mergeHashes matchers, matcher
    matchers
