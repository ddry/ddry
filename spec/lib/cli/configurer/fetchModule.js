// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        it: 'returns fallback path for ddry source `require`',
        i: ['../../../../spec/examples/spec/muteTape/spec'],
        e: '../../spec/examples/spec/muteTape/spec'
      }, {
        it: 'returns false for utterly failing paths',
        i: ['../../../utterly/failing/path'],
        e: false
      }
    ]);
  };

}).call(this);
