// Generated by CoffeeScript 2.4.1
(function() {
  'use strict';
  module.exports = function(dd, that) {
    return dd.drive({
      it: function(i, e) {
        return `returns ${e} for ${i[0]} '${i[1]}' tags`;
      },
      data: [
        {
          i: [],
          e: 'li'
        },
        {
          i: [5,
        null],
          e: 'li+li+li+li+li'
        },
        {
          i: [2,
        'div'],
          e: 'div+div'
        }
      ]
    });
  };

}).call(this);
