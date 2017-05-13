// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        it: 'returns default modular path for failing config',
        i: [],
        e: 'ddry/modular'
      }, {
        it: 'returns default modular path for config without `cli` property',
        i: [{}],
        e: 'ddry/modular'
      }, {
        it: 'returns default modular path for config without `cli.ddry` property',
        i: [
          {
            cli: 'failing'
          }
        ],
        e: 'ddry/modular'
      }, {
        it: 'finally fetches configured modular path',
        i: [
          {
            cli: {
              ddry: 'configured/modular'
            }
          }
        ],
        e: 'configured/modular'
      }
    ]);
  };

}).call(this);
