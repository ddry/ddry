'use strict'

io = require './io'
scope = require './scope'
object = require '../common/object'

module.exports =
  oe: (params) ->
    onlyIndex = params.indexOf '-o'
    exceptIndex = params.indexOf '-e'
    oneMode = params.slice 1
    return only: oneMode if exceptIndex is -1
    return except: oneMode if onlyIndex is -1
    oe = onlyIndex < exceptIndex
    _ =
      only: if oe then params.slice onlyIndex + 1, exceptIndex else params.slice onlyIndex + 1
      except: if oe then params.slice exceptIndex + 1 else params.slice exceptIndex + 1, onlyIndex

  render: (oe) ->
    cli = io.load true
    modulePaths = cli.modulePaths
    methodPaths = object.toArray modulePaths
    config = io.load()
    specPath = new RegExp "^#{config.spec}/"
    constraints = {}
    for mode, items of oe
      for item in items
        detect = scope.detect item, modulePaths, methodPaths, specPath
        if detect
          constraint = scope.key mode, detect
          object.insertKey constraints, constraint.key, constraint.value
    constraints
