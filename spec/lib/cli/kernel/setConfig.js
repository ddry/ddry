// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    var config;
    config = {
      code: 'lib'
    };
    return dd.drive([
      {
        before: function() {
          return dd.config = dd.helper.io.load();
        },
        it: 'fires command execution and saves config file if necessary',
        i: ['remove', [config, 'code', 'value']],
        e: true,
        after: function() {
          return dd.helper.io.save(dd.config);
        }
      }, {
        matcher: 'error',
        it: 'terminates test harness launch for usage info',
        i: ['usage'],
        e: ' ' + dd.helper.requireSafe('lib/cli/usage')['brief']
      }
    ]);
  };

}).call(this);
