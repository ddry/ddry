// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        matcher: 'error',
        it: 'throws `noConfigFound` error if config file missing',
        i: [true],
        e: (dd.helper.c.red('ERROR:')) + " No spec config file (" + (dd.helper.c.bright('ddry.json')) + ") found. Run 'ddry init' to create it first."
      }, {
        it: 'clears CLI scope and exits normally otherwise',
        i: [],
        e: true
      }
    ]);
  };

}).call(this);
