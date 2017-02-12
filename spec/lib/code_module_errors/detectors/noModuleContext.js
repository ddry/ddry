// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var helper;

  helper = require('../../../spec_helper');

  module.exports = function(dd) {
    return dd.drive([
      {
        it: "returns false for driver",
        i: ['title', {}, 'name', true],
        e: false
      }, {
        it: "returns false for object module",
        i: ['title', {}, 'name', false],
        e: false
      }, {
        it: "returns false for function module",
        i: ['title', helper.f, 'name', false],
        e: false
      }, {
        it: "returns name of invalid module",
        i: ['title', 'invalid', 'name', false],
        e: ['name']
      }
    ]);
  };

}).call(this);
