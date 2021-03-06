// Generated by CoffeeScript 1.12.6

/*
 * Code nodes parser
 */

(function() {
  'use strict';
  var dotted;

  dotted = require('../../common/dotted');

  module.exports = {
    get: function(specSet) {
      var _, instanceName;
      if (!Object.keys(specSet.instanceNames).length) {
        return this.singleton(specSet);
      }
      instanceName = this.instance(specSet);
      if (!instanceName) {
        return this.singleton(specSet);
      }
      return _ = {
        root: specSet.code,
        that: dotted.parse(specSet.code, instanceName)
      };
    },
    instance: function(specSet) {
      var i, instance, len, ref;
      ref = specSet.instanceNames;
      for (i = 0, len = ref.length; i < len; i++) {
        instance = ref[i];
        if (specSet.methodName.split(instance + ".").length > 1) {
          return instance;
        }
      }
      return false;
    },
    singleton: function(specSet) {
      var _;
      return _ = {
        root: specSet.code,
        that: specSet.code
      };
    }
  };

}).call(this);
