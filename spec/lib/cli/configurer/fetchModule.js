// Generated by CoffeeScript 2.4.1
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        it: 'returns fallback path for ddry source `require`',
        i: ['../../../../spec/examples/spec/muteTape/spec'],
        e: `${dd.helper.prefix}spec/examples/spec/muteTape/spec`
      },
      {
        it: 'returns false for utterly failing paths',
        i: ['../../../utterly/failing/path'],
        e: false
      }
    ]);
  };

}).call(this);
