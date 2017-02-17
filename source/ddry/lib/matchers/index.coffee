'use strict'

helpers = require './helpers'
parseMethodName = require '../parse_method_name'

module.exports =
  default: (code, i, e, tapeContext, tapeMessage) ->
    helpers.compare i, e, tapeContext, tapeMessage
    true

  anyOrder: (code, i, e, tapeContext, tapeMessage) ->
    actual = helpers.compareUnordered i, e
    helpers.compare actual, helpers.cleanArray, tapeContext, tapeMessage
    true

  property: (code, i, e, tapeContext, tapeMessage) ->
    for key, value of e
      actual = parseMethodName code, key
      helpers.compare actual, value, tapeContext, tapeMessage
    true
