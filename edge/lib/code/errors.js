// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var parseMethodName;

  parseMethodName = require('../parse_method_name');

  module.exports = {
    order: ['noModuleContext', 'modulePropertiesError', 'methodNotDefined'],
    detectors: {
      noModuleContext: function(title, that, name, use) {
        var functionLike, objectLike;
        if (use) {
          return false;
        }
        objectLike = that && typeof that === 'object';
        functionLike = typeof that === 'function';
        if (!(objectLike || functionLike)) {
          return [name];
        }
        return false;
      },
      modulePropertiesError: function(title, that, name, use) {
        var method;
        if (use) {
          return false;
        }
        method = parseMethodName(that, name);
        if (Array.isArray(method)) {
          return [title, name, method[0], method[1]];
        }
        return false;
      },
      methodNotDefined: function(title, that, name, use) {
        var method;
        if (use) {
          return false;
        }
        if (typeof that === 'function') {
          return false;
        }
        method = parseMethodName(that, name);
        if (typeof method !== 'function') {
          return [title, name];
        }
        return false;
      }
    },
    messages: {
      noModuleContext: function(name) {
        return {
          title: 'No module context set.',
          messages: ["Nowhere to place method '" + name + "'."]
        };
      },
      modulePropertiesError: function(title, name, xpath, key) {
        return {
          title: "Could not reach method '" + name + "' in '" + title + "'",
          messages: ["Trod to '" + (xpath.join('.')) + "', no '" + key + "' there."]
        };
      },
      methodNotDefined: function(title, name) {
        return {
          title: "Method " + name + "()",
          messages: ["is not defined in '" + title + "'"]
        };
      }
    }
  };

}).call(this);
