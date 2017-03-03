// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var codeNodes, extend, params, testEngine;

  codeNodes = require('./code_nodes');

  extend = require('../../common/object').extend;

  params = require('./params');

  testEngine = require('../../test/engine');

  module.exports = {
    parseSpecSetParams: function(code, name, dd, tapContext) {
      var specSet;
      specSet = {
        code: code,
        harness: dd.harness,
        instanceNames: dd.instanceNames,
        instancesList: dd.instancesList,
        matchers: dd.matchers,
        methodName: name,
        sharedSpecKeys: {},
        specs: [],
        tapContext: tapContext,
        use: dd.use
      };
      return extend(specSet, codeNodes.get(specSet));
    },
    process: function(specSet, code, name, dd, tapContext) {
      var specSetParams;
      specSetParams = this.parseSpecSetParams(code, name, dd, tapContext);
      if (!Array.isArray(specSet)) {
        specSet = [specSet];
      }
      specSet = this.processSpecSet(specSet, specSetParams);
      testEngine.outputTape(specSet);
      return specSet;
    },
    processSpecSet: function(specSet, specSetParams) {
      var i, len, spec, specParams, specs;
      for (i = 0, len = specSet.length; i < len; i++) {
        spec = specSet[i];
        specParams = params.collect(spec, specSetParams);
        if (specParams) {
          testEngine.outputMocha(specParams, specSetParams);
        }
        specs = specSetParams.specs.concat(specParams);
        specSetParams.specs = specs;
      }
      return specSetParams;
    }
  };

}).call(this);