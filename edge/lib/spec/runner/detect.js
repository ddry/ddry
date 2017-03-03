// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = {
    single: function(spec) {
      var keys;
      keys = Object.keys(spec);
      if (keys.indexOf('i') === -1) {
        return false;
      }
      if (!(Array.isArray(spec.i) || spec.matcher === 'plain')) {
        return false;
      }
      if (keys.indexOf('e') === -1) {
        return false;
      }
      return true;
    },
    sequence: function(spec, specParams) {
      if (!Array.isArray(spec.data)) {
        return false;
      }
      if (!spec.data.length) {
        return false;
      }
      return true;
    }
  };

}).call(this);
