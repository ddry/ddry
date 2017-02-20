'use strict'

assert = require 'assert'
common = require '../common/object'

module.exports =
  cleanArray:
    extra: []
    missing: []

  balance: (assertion) ->
    actualArray = Array.isArray assertion.actual
    expectedArray = Array.isArray assertion.expected
    return assertion if actualArray is expectedArray
    return @.makeArray assertion, 'expected' if actualArray
    @.makeArray assertion, 'actual'

  compare: (i, e, tapeContext, tapeMessage) ->
    @.tapeContext = tapeContext
    @.tapeMessage = tapeMessage
    assertion =
      actual: common.report i
      expected: common.report e
    assertion = @.balance assertion
    return @.compareValues assertion unless Array.isArray assertion.actual
    @compareObjects assertion

  compareValues: (assertion) ->
    if @.tapeContext
      @.tapeContext.deepEqual assertion.actual, assertion.expected, @.tapeMessage
    else
      assert.deepEqual assertion.actual, assertion.expected
    true

  compareObjects: (assertion) ->
    assertionReport = @.compareUnordered assertion.actual, assertion.expected
    if @.tapeContext
      @.tapeContext.deepEqual assertionReport, @.cleanArray, @.tapeMessage
    else
      assert.deepEqual assertionReport, @.cleanArray
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

  makeArray: (hash, key) ->
    hash[key] = [ hash[key] ]
    hash
