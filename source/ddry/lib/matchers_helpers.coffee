'use strict'

assert = require 'assert'
parseMethodName = require './parse_method_name'
objectReport = require './object_report'

module.exports =
  getThatProperty: (code, key) ->
    parseMethodName code, key

  compare: (i, e, tapeContext, tapeMessage) ->
    if tapeContext
      tapeContext.deepEqual @.report(i), @.report(e), tapeMessage
    else
      assert.deepEqual @.report(i), @.report(e)

  report: (value) ->
    return objectReport value if typeof value is 'object'
    if typeof value is 'function'
      definition = "#{value}".replace(/ /g, '')
      return definition.replace(/__cov_[^\+]*\+\+;/g, '')
    "#{value}"
