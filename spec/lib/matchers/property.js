// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd) {
    var code;
    code = dd.helper.requireSafe('spec/examples/code/lib/properties');
    code.few = 2;
    code.many = 4;
    return dd.drive({
      it: 'matches given code module public properties with given values',
      i: [
        code, null, {
          few: 2,
          many: 4
        }
      ],
      e: true
    });
  };

}).call(this);