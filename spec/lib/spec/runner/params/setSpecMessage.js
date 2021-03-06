// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    var message;
    dd.drive([
      {
        it: 'returns message string if original spec message is string',
        i: ['pending', 'does smth'],
        e: 'pending: does smth'
      }, {
        it: 'returns message function if original spec message is function',
        i: ['pending', dd.helper.message],
        e: dd.that.messageFunction()
      }
    ]);
    message = dd.that.messageFunction('pending', dd.helper.message);
    return dd.drive({
      matcher: 'plain',
      it: 'returns message function if original spec message is function',
      i: message(1, 1),
      e: 'pending: returns 1 for 1'
    });
  };

}).call(this);
