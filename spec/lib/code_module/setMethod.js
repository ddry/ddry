// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var helper, validModule;

  helper = require('../../spec_helper');

  validModule = {
    title: 'numbering',
    path: 'spec/examples/code/lib/numbering'
  };

  module.exports = function(dd, that) {
    var ddry, ddryWithoutModuleContext;
    ddryWithoutModuleContext = helper.dd();
    dd.drive({
      it: "returns false out of module context",
      i: [ddryWithoutModuleContext, 'ordinal', helper.f],
      e: false
    });
    ddry = helper.dd();
    ddry.module(validModule, helper.f);
    return dd.drive([
      {
        it: "returns false for non-existent method name",
        i: [ddry, 'not.defined.method', helper.f],
        e: false
      }, {
        it: "returns false for non-existent specs file of valid method",
        i: [ddry, 'ordinal', 'method/specs/file/path'],
        e: false
      }, {
        it: "applies given specs to method with given name",
        i: [ddry, 'ordinal', helper.f],
        e: helper.f
      }
    ]);
  };

}).call(this);
