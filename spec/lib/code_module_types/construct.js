// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var Instance, helper;

  helper = require('../../spec_helper');

  Instance = helper.requireSafe('spec/examples/code/lib/instance');

  module.exports = function(dd) {
    return dd.drive({
      it: 'creates instance with constructor and initial values',
      i: [Instance, ['title', 'message']],
      e: new Instance('title', 'message')
    });
  };

}).call(this);
