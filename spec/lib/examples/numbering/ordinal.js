// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd, that) {
    return dd.drive([
      {
        it: function(i, e) {
          return "returns " + e + " for " + i;
        },
        data: ['1st', '2nd', '3rd', '4th']
      }, {
        it: function(i, e) {
          return "returns " + e + " for " + i;
        },
        from: 11,
        data: ['11th', '12th', '13th']
      }, {
        it: function(i, e) {
          return "returns " + e + " for " + i;
        },
        from: 21,
        data: ['21st', '22nd', '23rd']
      }
    ]);
  };

}).call(this);
