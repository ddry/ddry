'use strict'

assert = require 'assert'
report = require './object_report'

module.exports =
  cleanArray:
    extra: []
    missing: []

  compare: (i, e, tapeContext, tapeMessage) ->
    if tapeContext
      tapeContext.deepEqual report(i), report(e), tapeMessage
    else
      assert.deepEqual report(i), report(e)
    true

  compareUnordered: (i, e) ->
    result =
      extra: []
      missing: []
    for element in i
      result.missing.push element if e.indexOf(element) is -1
    for element in e
      result.extra.push element if i.indexOf(element) is -1
    result
