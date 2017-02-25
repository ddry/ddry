// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var core;

  core = require('./require_safe_core');

  module.exports = function(params) {
    if (typeof params === 'string') {
      params = {
        title: params,
        path: params
      };
    }
    if (params.prefix) {
      core.setPrefix(params.prefix);
    }
    if (!((params.title != null) && (params.path != null))) {
      return false;
    }
    return core.loadModule(params.title, params.path);
  };

}).call(this);