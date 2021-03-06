// Generated by CoffeeScript 1.12.6

/*
 * Assertion helpers
 */

(function() {
  'use strict';
  var assert, report, unordered;

  assert = require('assert');

  report = require('../common/object/report').create;

  unordered = require('../common/unordered');

  module.exports = {
    balance: function(assertion) {
      var actualArray, expectedArray;
      actualArray = Array.isArray(assertion.actual);
      expectedArray = Array.isArray(assertion.expected);
      if (actualArray === expectedArray) {
        return assertion;
      }
      if (actualArray) {
        return this.makeArray(assertion, 'expected');
      }
      return this.makeArray(assertion, 'actual');
    },
    compare: function(data, tapContext, tapMessage) {
      var assertion;
      this.tapContext = tapContext;
      this.tapMessage = tapMessage;
      assertion = {
        actual: report(data.actual),
        expected: report(data.expected)
      };
      assertion = this.balance(assertion);
      if (!Array.isArray(assertion.actual)) {
        return this.compareValues(assertion);
      }
      return this.compareObjects(assertion);
    },
    compareValues: function(assertion) {
      if (this.tapContext) {
        this.tapContext.deepEqual(assertion.actual, assertion.expected, this.tapMessage);
      } else {
        assert.deepEqual(assertion.actual, assertion.expected);
      }
      return true;
    },
    compareObjects: function(assertion) {
      var assertionReport;
      assertionReport = unordered.compare(assertion.actual, assertion.expected);
      if (this.tapContext) {
        this.tapContext.deepEqual(assertionReport, unordered.clean, this.tapMessage);
      } else {
        assert.deepEqual(assertionReport, unordered.clean);
      }
      return true;
    },
    makeArray: function(hash, key) {
      hash[key] = [hash[key]];
      return hash;
    }
  };

}).call(this);
