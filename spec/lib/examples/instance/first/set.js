// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        matcher: 'property',
        it: 'Sets instance property',
        i: [
          'prop01', {
            one: function() {
              return 1;
            },
            two: function() {
              return 2;
            }
          }
        ],
        e: {
          "prop01.one": function() {
            return 1;
          },
          "prop01.two": function() {
            return 2;
          }
        }
      }
    ]);
  };

}).call(this);
