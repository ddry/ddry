// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    var ddry, singleton;
    ddry = dd.helper.ddry();
    ddry.modular({
      outside: {
        module: 'spec/examples/code/lib/function_export'
      }
    });
    singleton = dd.helper.requireSafe('spec/examples/code/lib/function_export');
    return dd.drive({
      it: 'returns stored function singleton',
      i: [ddry, null, singleton],
      e: singleton
    });
  };

}).call(this);
