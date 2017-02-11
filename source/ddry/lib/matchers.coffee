'use strict'

helpers = require './matchers_helpers'

module.exports =
  default: (code, i, e, tapeContext, tapeMessage) ->
    if typeof e is 'function'
      expected = e()
      for key, value of expected
        actual = helpers.getThatProperty code, key
        helpers.compare actual, value, tapeContext, tapeMessage
    else
      helpers.compare i, e, tapeContext, tapeMessage

  expectFunction: (code, i, e, tapeContext, tapeMessage) ->
    helpers.compare i, e, tapeContext, tapeMessage
