// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        before: function() {
          return this.messageGenerator = dd.helper.message;
        },
        it: 'includes assertion data aliases into assertion message',
        i: [
          {
            it: dd.helper.message,
            matcher: 'default',
            mochaMethod: 'it'
          }, [], true, 'empty input', 'true'
        ],
        e: {
          matcher: 'default',
          message: 'returns true for empty input',
          mochaMethod: 'it',
          it: dd.helper.message,
          input: [],
          expected: true
        }
      }
    ]);
  };

}).call(this);