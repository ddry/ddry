// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd, that) {
    that.moduleName = 'name';
    return dd.drive([
      {
        before: function() {
          return that.params = {};
        },
        it: "returns false if set option is not specified",
        i: ['use'],
        e: false
      }, {
        before: function() {
          return that.params = {
            use: ['noname', 'allname']
          };
        },
        it: "determines if name is not listed in set option",
        i: ['use'],
        e: false
      }, {
        before: function() {
          return that.params = {
            use: ['name', 'noname', 'allname']
          };
        },
        it: "determines if name is listed in set option",
        i: ['use'],
        e: true
      }
    ]);
  };

}).call(this);