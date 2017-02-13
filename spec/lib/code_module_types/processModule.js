// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd) {
    var ddry, numbering;
    ddry = dd.helper.ddry();
    ddry.modular({
      outside: {
        module: 'spec/examples/code/lib/numbering'
      }
    });
    numbering = dd.helper.requireSafe('spec/examples/code/lib/numbering');
    return dd.drive({
      it: 'returns stored module singleton',
      i: [ddry, null, numbering],
      e: numbering
    });
  };

}).call(this);
