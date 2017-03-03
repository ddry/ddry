'use strict'

dotted = require '../../common/dotted'

module.exports =
  get: (specSet) ->
    return @.singleton specSet unless Object.keys(specSet.instanceNames).length
    instanceName = @.instance specSet
    return @.singleton specSet unless instanceName
    _ =
      root: specSet.code
      that: dotted.parse specSet.code, instanceName

  instance: (specSet) ->
    for instance in specSet.instanceNames
      return instance if specSet.methodName.split("#{instance}.").length > 1
    false

  singleton: (specSet) ->
    _ =
      root: specSet.code
      that: specSet.code
