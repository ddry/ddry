// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  var validModule;

  validModule = {
    title: 'numbering',
    path: 'spec/examples/code/numbering'
  };

  module.exports = function(dd) {
    var ddry;
    ddry = dd.helper.ddry();
    return dd.drive([
      {
        it: "returns 'false' for non-existent path",
        i: [ddry, 'title', 'spec'],
        e: false
      }, {
        it: "delegates processing of specified module spec folder",
        i: [ddry, validModule, 'spec/file/path'],
        e: false
      }, {
        it: "loads valid module",
        i: [ddry, validModule, dd.helper.f],
        e: validModule
      }
    ]);
  };

}).call(this);
