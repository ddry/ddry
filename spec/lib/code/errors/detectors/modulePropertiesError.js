// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        it: "returns false for driver",
        i: ['title', {}, 'name', true],
        e: false
      }, {
        it: "returns false for function module",
        i: ['title', dd.helper.f, 'name', false],
        e: false
      }, {
        it: "returns trodden part of failing path",
        i: [
          'title', {
            deep: {
              deep: {
                deep: {
                  inside: {
                    method: dd.helper.f
                  }
                }
              }
            }
          }, 'deep.deep.deep.inside.failure', false
        ],
        e: ['title', 'deep.deep.deep.inside.failure', ['deep', 'deep', 'deep', 'inside'], 'failure']
      }
    ]);
  };

}).call(this);
