// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        it: 'inserts key deep into object',
        i: [
          {
            one: {
              two: {
                three: {
                  four1: 1,
                  four2: 2
                }
              }
            }
          }, 'one.two.three.four3', 3
        ],
        e: {
          one: {
            two: {
              three: {
                four1: 1,
                four2: 2,
                four3: 3
              }
            }
          }
        }
      }, {
        it: 'inserts object deep into object',
        i: [
          {
            one: {
              two: {
                three: {
                  four1: 1,
                  four2: 2
                }
              }
            }
          }, 'one.two.three', {
            four3: 3
          }
        ],
        e: {
          one: {
            two: {
              three: {
                four1: 1,
                four2: 2,
                four3: 3
              }
            }
          }
        }
      }, {
        it: 'inserts array deep into object',
        i: [
          {
            one: {
              two: {
                three: [1, 2]
              }
            }
          }, 'one.two.three', 3
        ],
        e: {
          one: {
            two: {
              three: [1, 2, 3]
            }
          }
        }
      }
    ]);
  };

}).call(this);
