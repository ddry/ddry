// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        before: function() {
          this.item = 'index.js';
          return this.modulePaths = {
            index: 'index'
          };
        },
        it: 'returns code module name if its path listed',
        i: [],
        e: 'index'
      }, {
        before: function() {
          return this.item = 'fail.js';
        },
        it: 'returns false if item path is not listed',
        i: [],
        e: false,
        after: function() {
          delete this.item;
          return delete this.modulePaths;
        }
      }
    ]);
  };

}).call(this);
