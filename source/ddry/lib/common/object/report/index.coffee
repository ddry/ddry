###
# Object report core
###

'use strict'

methods = require './methods'

module.exports =
  clarify: methods.clarify
  extend: methods.extend
  format: methods.format
  isObject: methods.isObject

  create: (value, hash = false) ->
    return methods.format value unless methods.validObject value
    report = methods.create value, null, null, hash
    return report unless hash
    reportHash = {}
    for key in report
      reportHash = methods.extend reportHash, key
    reportHash
