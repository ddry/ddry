// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var assertion, forMocha, outputs, tap;

  forMocha = require('../common/harness').forMocha;

  assertion = require('../assertion');

  outputs = require('./outputs');

  if (!forMocha()) {
    tap = require('./tap');
  }

  module.exports = {
    output: true,
    muteOutput: function() {
      return this.output = false;
    },
    modular: function(dd, output, mocha, testTap) {
      if (output == null) {
        output = this.output;
      }
      if (!output) {
        return false;
      }
      if (mocha == null) {
        mocha = forMocha();
      }
      if (mocha) {
        return false;
      }
      tap = tap || testTap;
      tap.process(dd);
      return true;
    },
    describeModule: function(dd, params, specs) {
      if (!this.output) {
        return false;
      }
      if (!forMocha()) {
        return false;
      }
      describe(params.title, function() {
        return specs(dd.that);
      });
      return true;
    },
    describeMethod: function(dd, name, specs) {
      if (!this.output) {
        return false;
      }
      if (!forMocha()) {
        return false;
      }
      if (dd.use) {
        specs(dd, dd.that.use);
        return true;
      }
      if (typeof dd.methodName === 'boolean') {
        specs(dd, dd.that);
      } else {
        describe(name + "()", function() {
          return specs(dd, dd.that);
        });
      }
      return true;
    },
    outputMocha: function(specParams, specSet) {
      if (!this.output) {
        return;
      }
      if (!forMocha()) {
        return;
      }
      if (specSet.use) {
        return specParams.forEach(function(spec) {
          return global[spec.mochaMethod](spec.message, function() {
            return specSet.matchers[spec.matcher](specSet.code, spec.input, spec.expected);
          });
        });
      } else {
        return specParams.forEach(function(spec) {
          return global[spec.mochaMethod](spec.message, function() {
            return assertion.make(spec, specSet);
          });
        });
      }
    },
    outputTape: function(specSet) {
      var i, len, ref, results, spec;
      if (!this.output) {
        return;
      }
      if (forMocha()) {
        return;
      }
      ref = specSet.specs;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        spec = ref[i];
        results.push(assertion.make(spec, specSet));
      }
      return results;
    },
    sendOutput: function(harness, type, argArray) {
      if (!this.output) {
        return false;
      }
      return outputs[type][harness].apply(this, argArray);
    }
  };

}).call(this);