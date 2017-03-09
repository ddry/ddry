###
# Modular spec attachments processing
###

'use strict'

object = require '../common/object'
folders = require './folders'
requireSafe = require '../fs/require_safe'

module.exports =
  helper: (helper) ->
    return false unless helper and typeof helper is 'object'
    return false unless typeof helper.path is 'string'
    return false unless Array.isArray helper.initial
    Helper = requireSafe helper.path
    return false unless typeof Helper is 'function'
    object.construct Helper, helper.initial

  matchers: (pathsArray) ->
    matchers = {}
    for matcherPath in pathsArray
      matcher = requireSafe matcherPath
      if matcher
        object.extend matchers, matcher
    matchers

  outside: (codeModules, params) ->
    return codeModules unless params.outside and typeof params.outside is 'object'
    for name, outsidePath of params.outside
      outside = folders.outside name, outsidePath
      object.extend codeModules, outside
    codeModules
