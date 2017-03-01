// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        it: 'collects assertion data of single fixture',
        i: [
          {
            it: dd.helper.message,
            data: [
              {
                i: [],
                e: void 0
              }
            ],
            from: 1
          }, 1, {
            it: dd.helper.message,
            matcher: 'default',
            mochaMethod: 'it'
          }
        ],
        e: {
          matcher: 'default',
          message: 'returns undefined for ',
          mochaMethod: 'it',
          it: dd.helper.message,
          input: [],
          expected: void 0
        }
      }, {
        it: 'collects assertion data by given index of sequence',
        i: [
          {
            it: dd.helper.message,
            data: [
              {
                i: [],
                e: true
              }, {
                i: {
                  'empty input': []
                },
                e: {
                  'cool output': void 0
                }
              }, {
                i: [],
                e: false
              }
            ],
            from: 1
          }, 2, {
            it: dd.helper.message,
            matcher: 'default',
            mochaMethod: 'it'
          }
        ],
        e: {
          matcher: 'default',
          message: 'returns cool output for empty input',
          mochaMethod: 'it',
          it: dd.helper.message,
          input: [],
          expected: void 0
        }
      }, {
        it: 'fallbacks to index if no input given',
        i: [
          {
            it: dd.helper.message,
            data: ['20th', '21st', '22nd', '23rd'],
            from: 20
          }, 22, {
            it: dd.helper.message,
            matcher: 'default',
            mochaMethod: 'it'
          }
        ],
        e: {
          matcher: 'default',
          message: 'returns 22nd for 22',
          mochaMethod: 'it',
          it: dd.helper.message,
          input: [22],
          expected: '22nd'
        }
      }
    ]);
  };

}).call(this);
