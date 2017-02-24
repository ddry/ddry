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

  compare: (data, tapContext, tapMessage) ->
    @.tapContext = tapContext
    @.tapMessage = tapMessage
    assertion =
      actual: report data.actual
      expected: report data.expected
    assertion = @.balance assertion
    return @.compareValues assertion unless Array.isArray assertion.actual
    @.compareObjects assertion

  compareValues: (assertion) ->
    if @.tapContext
      @.tapContext.deepEqual assertion.actual, assertion.expected, @.tapMessage
    else
      assert.deepEqual assertion.actual, assertion.expected
    true

  compareObjects: (assertion) ->
    assertionReport = unordered.compare assertion.actual, assertion.expected
    if @.tapContext
      @.tapContext.deepEqual assertionReport, unordered.clean, @.tapMessage
    else
      assert.deepEqual assertionReport, unordered.clean
    true

  makeArray: (hash, key) ->
    hash[key] = [ hash[key] ]
    hash
