// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd) {
    var errorHash, unordered;
    errorHash = dd.helper.requireSafe('lib/code/errors');
    unordered = dd.helper.extend({}, errorHash);
    delete unordered.order;
    return dd.drive([
      {
        it: "returns false for independent error conditions",
        i: [unordered],
        e: false
      }, {
        it: "returns true if guard clause order specified",
        i: [errorHash],
        e: true
      }
    ]);
  };

}).call(this);