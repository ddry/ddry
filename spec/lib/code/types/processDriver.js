// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    var ddry, instance;
    ddry = dd.helper.ddry();
    instance = dd.helper.requireSafe('spec/examples/code/lib/instance');
    return dd.drive({
      it: 'returns empty generators hash',
      i: [ddry, null, instance],
      e: {}
    });
  };

}).call(this);
