// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd) {
    var clearSpec, closeSpec, code, spec, specSet, wrongSpec;
    code = dd.helper.requireSafe('lib/common/object');
    spec = function(expected) {
      return {
        input: [
          {}, {
            one: 1,
            two: 2,
            six: 6,
            ten: 10
          }
        ],
        expected: expected
      };
    };
    specSet = {
      code: code,
      root: code,
      that: code,
      instanceNames: {},
      methodName: 'extend'
    };
    clearSpec = spec({
      one: 1,
      ten: 10
    });
    closeSpec = spec({
      one: 10,
      ten: 10
    });
    wrongSpec = spec({
      three: 3
    });
    return dd.ry({
      clear: {
        context: 'If actual object contains expected data',
        it: 'returns clear actual',
        i: [clearSpec, specSet],
        e: {
          actual: [],
          expected: []
        }
      },
      close: {
        context: 'If actual object partially contains expected data',
        it: 'returns differing part actual',
        i: [closeSpec, specSet],
        e: {
          actual: ['one: 10'],
          expected: []
        }
      },
      wrong: {
        context: 'If actual object does not contain expected data',
        it: 'returns missing actual data',
        i: [wrongSpec, specSet],
        e: {
          actual: ['three: 3'],
          expected: []
        }
      }
    });
  };

}).call(this);
