// Generated by CoffeeScript 2.4.1
(function() {
  /*
   * ddry core modular wrapper
   */
  'use strict';
  var DataDriven, dd, object;

  object = require('./lib/common/object');

  DataDriven = require('./index');

  dd = new DataDriven();

  module.exports = function(config = {}) {
    return {
      config: config,
      dd: dd,
      setPrefix: function(prefix) {
        return this.dd.module({
          prefix: prefix
        });
      },
      apply: function(constraints = {}) {
        var jobConfig;
        jobConfig = object.merge(this.config, constraints);
        return this.dd.modular(jobConfig);
      }
    };
  };

}).call(this);
