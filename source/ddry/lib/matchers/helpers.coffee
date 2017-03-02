'use strict'

dotted = require '../common/dotted'

module.exports =
  getActual: (spec, specSet) ->
    code = @.getCode specSet
    method = dotted.parse code.root, specSet.methodName, false
    method.apply code.that, spec.input

  getCode: (specSet) ->
    return @.singleton specSet unless Object.keys(specSet.instanceNames).length
    instanceName = @.getInstance specSet
    return @.singleton specSet unless instanceName
    _ =
      root: specSet.code
      that: dotted.parse specSet.code, instanceName

  getInstance: (specSet) ->
    for instance in specSet.instanceNames
      return instance if specSet.methodName.split("#{instance}.").length > 1
    false

  singleton: (specSet) ->
    _ =
      root: specSet.code
      that: specSet.code
