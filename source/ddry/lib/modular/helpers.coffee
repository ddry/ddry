'use strict'

object = require '../common/object'

module.exports =
  applyHarnessScope: (dd, params) ->
    harnessScope = params.harness
    return params unless harnessScope and typeof harnessScope is 'object'
    for harness, scope of harnessScope
      params = object.merge params, scope if dd.harness.split(harness).length > 1
    params

  filterHash: (hash, keys) ->
    return hash unless keys.length
    hashKeys = Object.keys hash
    filtered = {}
    for hashKey in hashKeys
      filtered[hashKey] = hash[hashKey] if hash[hashKey]? and object.match hashKey, keys
    filtered

  getFilteredList: (filesHash, params) ->
    list = Object.keys filesHash
    return list unless params and typeof params is 'object'
    params.only = object.toArray params.only
    list = Object.keys @.filterHash(filesHash, params.only)
    params.except = object.toArray params.except, 'string'
    return list unless Array.isArray params.except
    list.filter (name) ->
      not object.match name, params.except

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
