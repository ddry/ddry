// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    var config;
    config = {
      code: 'spec/examples/spec/muteTape'
    };
    return dd.drive([
      {
        it: 'returns unchanged config if command does not get titles',
        i: ['config', 'add'],
        e: 'config'
      }, {
        before: function() {
          return dd.cli = dd.helper.io.load(true);
        },
        it: 'parses the code folder for module titles',
        i: [config, 'titles'],
        e: {
          code: 'spec/examples/spec/muteTape',
          moduleTitles: {
            spec: 'spec/examples/spec/muteTape/spec'
          }
        },
        after: function() {
          return dd.helper.io.save(dd.cli, true);
        }
      }
    ]);
  };

}).call(this);
