// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        matcher: 'error',
        it: 'returns red-badged parameterized error message of given code',
        i: ['configurerMissing', 'failingPath'],
        e: (dd.helper.c.red('ERROR:')) + " Failed to load configurer file from " + (dd.helper.c.bright('failingPath'))
      }, {
        matcher: 'error',
        it: 'returns parameterized error message of given code calmly',
        i: ['configurerMissing', 'failingPath', true],
        e: " Failed to load configurer file from " + (dd.helper.c.bright('failingPath'))
      }
    ]);
  };

}).call(this);
