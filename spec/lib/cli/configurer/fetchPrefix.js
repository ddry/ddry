// Generated by CoffeeScript 2.4.1
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        it: 'returns false for failing config',
        i: [],
        e: false
      },
      {
        it: 'returns false for config without `cli` property',
        i: [{}],
        e: false
      },
      {
        it: 'returns false for failing `cli.prefix` property',
        i: [
          {
            cli: {
              prefix: {
                failing: 'prefix'
              }
            }
          }
        ],
        e: false
      },
      {
        it: 'finally fetches configured prefix',
        i: [
          {
            cli: {
              prefix: 'configured/prefix'
            }
          }
        ],
        e: 'configured/prefix'
      }
    ]);
  };

}).call(this);
