// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var MethodContext, construct;

  construct = require('./construct');

  MethodContext = require('./method_context');

  module.exports = {
    get: function(params, code) {
      if (params.use) {
        return 'Driver';
      }
      if (this.instanceValid(params, code)) {
        return 'Instance';
      }
      if (typeof code === 'function') {
        return 'Function';
      }
      return 'Module';
    },
    getThat: function(dd, name) {
      var code;
      if (!dd.use) {
        return dd.modules[dd.path];
      }
      code = dd.driverFactories[dd.path];
      return dd.drivers[dd.path][name] = construct(code, []);
    },
    instanceValid: function(params, code) {
      return Array.isArray(params.initial) && typeof code === 'function';
    },
    parseTitle: function(title, path) {
      var _;
      if (title && typeof title === 'object') {
        return title;
      }
      return _ = {
        title: title,
        path: path
      };
    },
    processDriver: function(dd, params, code) {
      dd.driverFactories[dd.path] = code;
      dd.drivers[dd.path] = {};
      return dd.generators[dd.path] = {};
    },
    processFunction: function(dd, params, code) {
      dd.modules[dd.path] = code;
      dd.methodName = false;
      dd.generators[dd.path] = new MethodContext(code, false, dd.matchers, dd.use);
      return dd.that = dd.modules[dd.path];
    },
    processInstance: function(dd, params, code) {
      dd.modules[dd.path] = construct(code, params.initial);
      dd.generators[dd.path] = {};
      return dd.that = dd.modules[dd.path];
    },
    processModule: function(dd, params, code) {
      dd.modules[dd.path] = code;
      dd.generators[dd.path] = {};
      return dd.that = dd.modules[dd.path];
    },
    setMethodName: function(dd, name) {
      var base;
      if (typeof dd.methodName === 'boolean') {
        return false;
      }
      dd.methodName = name;
      dd.that = this.getThat(dd, name);
      return (base = dd.generators[dd.path])[name] != null ? base[name] : base[name] = new MethodContext(dd.that, name, dd.matchers, dd.use);
    }
  };

}).call(this);
