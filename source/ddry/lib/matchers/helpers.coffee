'use strict'

assert = require 'assert'
common = require '../common'

module.exports =
  cleanArray:
    extra: []
    missing: []

  compare: (i, e, tapeContext, tapeMessage) ->
    if tapeContext
      tapeContext.deepEqual common.report(i), common.report(e), tapeMessage
    else
      assert.deepEqual common.report(i), common.report(e)
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
