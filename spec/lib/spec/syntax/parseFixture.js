// Generated by CoffeeScript 2.4.1
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        before: function() {
          return this.messageGenerator = dd.helper.message;
        },
        it: 'composes assertion message with its data if no aliases given',
        i: [
          {
            i: [],
            e: void 0
          },
          {
            it: dd.helper.message,
            matcher: 'default',
            mochaMethod: 'it'
          }
        ],
        e: {
          matcher: 'default',
          message: 'returns undefined for ',
          mochaMethod: 'it',
          it: dd.helper.message,
          input: [],
          expected: void 0
        }
      },
      {
        it: 'composes assertion message with data aliases if given',
        i: [
          {
            i: {
              'empty input': []
            },
            e: {
              'cool output': void 0
            }
          },
          {
            it: dd.helper.message,
            matcher: 'default',
            mochaMethod: 'it'
          }
        ],
        e: {
          matcher: 'default',
          message: 'returns cool output for empty input',
          mochaMethod: 'it',
          it: dd.helper.message,
          input: [],
          expected: void 0
        }
      }
    ]);
  };

}).call(this);
