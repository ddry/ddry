'use strict'

object = require '../../common/object'

module.exports = (code, initials, path) ->
  if Array.isArray initials
    instances =
      modules:
        "#{path}": object.construct code, initials
      instanceNames:
        "#{path}": {}
    return instances
  instances = {}
  initials = object.report initials, true
  for instanceName, initial of initials
    object.insertKey instances, instanceName, object.construct code, initial
  _ =
    modules:
      "#{path}": instances
    instanceNames:
      "#{path}": Object.keys initials
    instancesList:
      "#{path}": instances
