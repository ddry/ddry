// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        it: 'returns false for non-existent path',
        i: ['failing/path'],
        e: false
      }, {
        it: 'returns false for file name',
        i: ['index.js'],
        e: false
      }, {
        it: 'returns true for folder name',
        i: ['lib'],
        e: true
      }
    ]);
  };

}).call(this);
