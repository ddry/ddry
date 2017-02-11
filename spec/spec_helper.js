// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var DataDriven, requireSafe;

  DataDriven = require('../index');

  requireSafe = require('../lib/require_safe');

  module.exports = {
    dd: function(path) {
      var dd;
      if (path == null) {
        path = '';
      }
      dd = new DataDriven(path);
      dd.module({
        prefix: '../'
      });
      dd.muteOutput();
      return dd;
    },
    f: function() {
      return 1;
    },
    requireSafe: function(params) {
      return requireSafe(params);
    }
  };

}).call(this);
