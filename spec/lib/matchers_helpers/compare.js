// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd) {
    var spec;
    spec = function(tapeContext, tapeMessage) {
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
            }, tapeContext, tapeMessage
          ],
          e: true
        }, {
          it: 'compares functions comprehensively',
          i: [dd.helper.f, dd.helper.f, tapeContext, tapeMessage],
          e: true
        }, {
          it: 'compares plain values comprehensively',
          i: ['line', 'line', tapeContext, tapeMessage],
          e: true
        }
      ]);
    };
    dd.context('Without Tape context', function() {
      return spec();
    });
    return dd.context('With Tape context', function() {
      return spec(dd.helper.tapeStub, 'tape message');
    });
  };

}).call(this);
