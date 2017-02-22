'use strict'

object = require '../../common/object'

module.exports =
  mount: (dd, instances) ->
    for key in [ 'modules', 'instanceNames', 'instancesList' ]
      dd[key][dd.path] = instances[key] if instances[key]?
    dd

  parse: (code, initials) ->
    if Array.isArray initials
      instances =
        modules: object.construct code, initials
        instanceNames: {}
      return instances
    instances = {}
    initials = object.report initials, true
    for instanceName, initial of initials
      object.insertKey instances, instanceName, object.construct code, initial
    _ =
      modules: instances
      instanceNames: Object.keys initials
      instancesList: instances
