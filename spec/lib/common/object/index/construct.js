// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    var Instance;
    Instance = dd.helper.examples.instance;
    return dd.drive({
      it: 'creates instance with constructor and initial values',
      i: [Instance, ['title', 'message']],
      e: new Instance('title', 'message')
    });
  };

}).call(this);
