// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        it: 'filters given hash with given keys',
        i: [
          {
            one: 1,
            two: 2,
            three: 3
          }, ['one', 'four']
        ],
        e: {
          one: 1
        }
      }
    ]);
  };

}).call(this);
