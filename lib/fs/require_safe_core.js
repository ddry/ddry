// Generated by CoffeeScript 1.12.6

/*
 * Safe require core
 */

(function() {
  'use strict';
  var errorReport;

  errorReport = require('../common/error_report');

  module.exports = {
    prefix: '../../../../',
    errors: {
      order: ['loadError', 'malformedFile'],
      detectors: {
        loadError: function(title, module, path) {
          if (typeof module === 'string') {
            return [title, module];
          }
          return false;
        },
        malformedFile: function(title, module, path) {
          var containsFunction, containsModule;
          containsModule = !!Object.keys(module).length;
          containsFunction = typeof module === 'function';
          if (!(containsModule || containsFunction)) {
            return [title, path];
          }
          return false;
        }
      },
      messages: {
        loadError: function(title, module) {
          return {
            title: title,
            messages: ["fails to load module '" + module + "'"]
          };
        },
        malformedFile: function(title, module) {
          return {
            title: title,
            messages: ["contains no valid exports in '" + module + "'"]
          };
        }
      }
    },
    loadModule: function(title, path) {
      var module;
      module = this.requireModule(path);
      if (errorReport.toTestEngine(this.errors, [title, module, path])) {
        return false;
      }
      return module;
    },
    requireModule: function(path) {
      var local, packaged;
      local = this.tryRequire("" + this.prefix + path);
      if (typeof local !== 'string') {
        return local;
      }
      return packaged = this.tryRequire(path);
    },
    setPrefix: function(prefix) {
      return this.prefix = prefix;
    },
    tryRequire: function(path) {
      var e, module;
      try {
        module = require(path);
        return module;
      } catch (error) {
        e = error;
        return path;
      }
    }
  };

}).call(this);
