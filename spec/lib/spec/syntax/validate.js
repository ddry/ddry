// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        it: 'returns false if no spec object given',
        i: [],
        e: false
      }, {
        it: 'returns false if input data missing',
        i: [
          {
            e: true
          }
        ],
        e: false
      }, {
        it: 'returns false if expected data missing',
        i: [
          {
            i: ['data']
          }
        ],
        e: false
      }, {
        it: 'returns true if both parts of assertion present',
        i: [
          {
            i: [],
            e: void 0
          }
        ],
        e: true
      }
    ]);
  };

}).call(this);
