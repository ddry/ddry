// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        it: 'returns false if sequence data invalid',
        i: [
          {
            data: {}
          }
        ],
        e: false
      }, {
        it: 'returns false if sequence data empty',
        i: [
          {
            data: []
          }
        ],
        e: false
      }, {
        it: 'returns true if sequence data intact',
        i: [
          {
            data: [1]
          }
        ],
        e: true
      }
    ]);
  };

}).call(this);
