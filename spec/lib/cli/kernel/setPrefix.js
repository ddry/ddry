// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        before: function() {
          dd.ddryPrefix = process.env.DDRY_PREFIX;
          return process.env.NPM_ROOT = 'node_modules';
        },
        it: 'sets relative prefix for development environment',
        i: [],
        e: true
      }, {
        it: 'sets relative prefix for not development environments',
        i: [true],
        e: true,
        after: function() {
          return process.env.DDRY_PREFIX = dd.ddryPrefix;
        }
      }
    ]);
  };

}).call(this);
