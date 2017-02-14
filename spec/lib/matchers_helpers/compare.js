// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd) {
    dd.context('Without Tape context', function() {
      return dd.drive([
        {
          it: 'compares objects comprehensively',
          i: [
            {
              one: 1,
              two: 2
            }, {
              one: 1,
              two: 2
            }
          ],
          e: true
        }, {
          it: 'compares functions comprehensively',
          i: [dd.helper.f, dd.helper.f],
          e: true
        }, {
          it: 'compares plain values comprehensively',
          i: ['line', 'line'],
          e: true
        }
      ]);
    });
    return dd.context('With Tape context', function() {
      return dd.helper.tape.test('tape test', function(t) {
        dd.drive([
          {
            it: 'compares objects comprehensively',
            i: [
              {
                one: 1,
                two: 2
              }, {
                one: 1,
                two: 2
              }, t, 'tapeMessage'
            ],
            e: {
              extra: [],
              missing: []
            }
          }, {
            it: 'compares functions comprehensively',
            i: [dd.helper.f, dd.helper.f],
            e: {
              extra: [],
              missing: []
            }
          }, {
            it: 'compares plain values comprehensively',
            i: ['line', 'line'],
            e: {
              extra: [],
              missing: []
            }
          }
        ]);
        return t.end();
      });
    });
  };

}).call(this);
