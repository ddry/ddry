// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd) {
    return [1, 2, 3].forEach(function(n) {
      return dd.helper.context(dd, "With few set to " + n, [n], function() {
        return dd.drive([
          {
            before: function() {
              return this.few = n;
            },
            it: "Says '" + ('hi'.repeat(2 * n)) + "' once",
            i: [],
            e: 'hi'.repeat(2 * n)
          }, {
            it: "Says '" + ('blah'.repeat(2 * n)) + "' once",
            i: ['blah'],
            e: 'blah'.repeat(2 * n)
          }
        ]);
      });
    });
  };

}).call(this);
