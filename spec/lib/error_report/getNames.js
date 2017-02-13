// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var errorHash, helper;

  helper = require('../../spec_helper');

  errorHash = helper.requireSafe('lib/code_module_errors');

  module.exports = function(dd) {
    var unordered;
    unordered = helper.mergeHashes({}, errorHash);
    delete unordered.order;
    return dd.drive([
      {
        matcher: 'anyOrder',
        it: "returns unordered condition keys",
        i: [unordered],
        e: ['methodNotDefined', 'modulePropertiesError', 'noModuleContext']
      }, {
        it: "returns guard clause conditions order",
        i: [errorHash],
        e: ['noModuleContext', 'modulePropertiesError', 'methodNotDefined']
      }
    ]);
  };

}).call(this);
