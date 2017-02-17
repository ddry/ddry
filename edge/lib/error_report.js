// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var common, testEngine;

  common = require('./common');

  testEngine = require('./test_engine');

  module.exports = {
    toTestEngine: function(errorHash, paramsArray) {
      var errorReport;
      errorReport = this.detectErrors(errorHash, paramsArray);
      if (errorReport.length) {
        testEngine.sendOutput(common.harness(), 'report', [errorReport]);
        return true;
      }
      return false;
    },
    detectErrors: function(errorHash, paramsArray) {
      var names, ordered;
      ordered = this.isOrdered(errorHash);
      names = this.getNames(errorHash, ordered);
      return this.process(errorHash, paramsArray, names, ordered);
    },
    isOrdered: function(errorHash) {
      return Array.isArray(errorHash.order);
    },
    getNames: function(errorHash, ordered) {
      if (ordered) {
        return errorHash.order;
      }
      return Object.keys(errorHash.detectors);
    },
    process: function(errorHash, paramsArray, names, ordered) {
      var errorReport, gotError, i, len, name, reportStatement;
      errorReport = [];
      for (i = 0, len = names.length; i < len; i++) {
        name = names[i];
        gotError = errorHash.detectors[name].apply(null, paramsArray);
        if (gotError) {
          reportStatement = errorHash.messages[name].apply(null, gotError);
          errorReport.push(reportStatement);
          if (ordered) {
            return errorReport;
          }
        }
      }
      return errorReport;
    }
  };

}).call(this);
