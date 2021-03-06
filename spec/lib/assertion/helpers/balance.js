// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        before: function() {
          process.env.MUTE_CONSOLE = 'true';
          return process.env.DDRY_CLI = dd.helper.setCli(process.env.DDRY_DEV, process.env.NPM_ROOT);
        },
        it: 'returns assertion unchanged if both sides are values',
        i: [
          {
            actual: 1,
            expected: 2
          }
        ],
        e: {
          actual: 1,
          expected: 2
        }
      }, {
        it: 'returns assertion unchanged if both sides are arrays',
        i: [
          {
            actual: [1],
            expected: [2]
          }
        ],
        e: {
          actual: [1],
          expected: [2]
        }
      }, {
        it: 'makes an array of actual to match expected',
        i: [
          {
            actual: 1,
            expected: [2]
          }
        ],
        e: {
          actual: [1],
          expected: [2]
        }
      }, {
        it: 'makes an array of expected to match actual',
        i: [
          {
            actual: [1],
            expected: 2
          }
        ],
        e: {
          actual: [1],
          expected: [2]
        }
      }
    ]);
  };

}).call(this);
