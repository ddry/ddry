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
