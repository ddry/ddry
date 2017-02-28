// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var forMocha;

  forMocha = require('../common/harness').forMocha;

  module.exports = {
    run: function(dd, title, methodList) {
      var that;
      if (!forMocha()) {
        return this.processMethodList(dd, methodList);
      }
      that = this;
      return describe(title, function() {
        return that.processMethodList(dd, methodList);
      });
    },
    processMethodList: function(dd, methodList) {
      var methodFile, methodName, results;
      results = [];
      for (methodName in methodList) {
        methodFile = methodList[methodName];
        results.push(dd.method(methodName, methodFile));
      }
      return results;
    }
  };

}).call(this);
