'use strict'

harness = require './harness'
testEngine = require './test/engine'

module.exports =
  toTestEngine: (errorHash, paramsArray) ->
    errorReport = @.detectErrors errorHash, paramsArray
    if errorReport.length
      testEngine.sendOutput harness(), 'report', [ errorReport ]
      return true
    false

  detectErrors: (errorHash, paramsArray) ->
    ordered = @.isOrdered errorHash
    names = @.getNames errorHash, ordered
    @.process errorHash, paramsArray, names, ordered

  isOrdered: (errorHash) ->
    Array.isArray errorHash.order

  getNames: (errorHash, ordered) ->
    return errorHash.order if ordered
    Object.keys errorHash.detectors

  process: (errorHash, paramsArray, names, ordered) ->
    errorReport = []
    for name in names
      gotError = errorHash.detectors[name].apply null, paramsArray
      if gotError
        reportStatement = errorHash.messages[name].apply null, gotError
        errorReport.push reportStatement
        return errorReport if ordered
    errorReport
