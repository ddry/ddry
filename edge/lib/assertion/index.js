// Generated by CoffeeScript 1.12.3

/*
 * Assertion engine
 */

(function() {
  'use strict';
  var helpers;

  helpers = require('./helpers');

  module.exports = {
    make: function(spec, specSet) {
      if (spec.before) {
        spec.before.call(specSet.that);
      }
      this.data = specSet.matchers[spec.matcher](spec, specSet);
      this[specSet.harness](spec, specSet);
      if (spec.after) {
        spec.after.call(specSet.that);
      }
      return true;
    },
    mocha: function(spec, specSet) {
      return helpers.compare(this.data);
    },
    tape: function(spec, specSet) {
      if (/x/.test(spec.mochaMethod)) {
        return specSet.tapContext.skip(spec.message);
      }
      return helpers.compare(this.data, specSet.tapContext, spec.message);
    },
    tap: function(spec, specSet) {
      if (/x/.test(spec.mochaMethod)) {
        spec.message = "# skip " + spec.message;
      }
      return helpers.compare(this.data, specSet.tapContext, spec.message);
    }
  };

}).call(this);
