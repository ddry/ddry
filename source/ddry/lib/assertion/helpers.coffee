'use strict'

assert = require 'assert'
report = require('../common/object/report').create
unordered = require '../common/unordered'

module.exports =
  balance: (assertion) ->
    actualArray = Array.isArray assertion.actual
    expectedArray = Array.isArray assertion.expected
    return assertion if actualArray is expectedArray
    return @.makeArray assertion, 'expected' if actualArray
    @.makeArray assertion, 'actual'

  compare: (data, tapeContext, tapeMessage) ->
    @.tapeContext = tapeContext
    @.tapeMessage = tapeMessage
    assertion =
      actual: report data.actual
      expected: report data.expected
    assertion = @.balance assertion
    return @.compareValues assertion unless Array.isArray assertion.actual
    @.compareObjects assertion

  compareValues: (assertion) ->
    if @.tapeContext
      @.tapeContext.deepEqual assertion.actual, assertion.expected, @.tapeMessage
    else
      assert.deepEqual assertion.actual, assertion.expected
    true

  compareObjects: (assertion) ->
    assertionReport = unordered.compare assertion.actual, assertion.expected
    if @.tapeContext
      @.tapeContext.deepEqual assertionReport, unordered.clean, @.tapeMessage
    else
      assert.deepEqual assertionReport, unordered.clean
    true

  makeArray: (hash, key) ->
    hash[key] = [ hash[key] ]
    hash
