'use strict'

testEngine = require './test_engine'

module.exports =
  toTestEngine: (errorHash, paramsArray) ->
    errorReport = @.detectErrors errorHash, paramsArray
    if errorReport.length
      testEngine.report errorReport
      return true
    false

  detectErrors: (errorHash, paramsArray) ->
    ordered = !!errorHash.order
    names = if ordered
    then errorHash.order
    else Object.keys errorHash.detectors
    @.process errorHash, paramsArray, names, ordered

  process: (errorHash, paramsArray, names, ordered) ->
    errorReport = []
    for name in names
      gotError = errorHash.detectors[name].apply null, paramsArray
      if gotError
        reportStatement = errorHash.messages[name].apply null, gotError
        errorReport.push reportStatement
        return errorReport if ordered
    errorReport
