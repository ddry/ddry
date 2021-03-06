// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    var code, ddry;
    ddry = dd.helper.ddry();
    ddry.path = 'instance_path';
    code = dd.helper.examples.instance;
    return dd.drive([
      {
        matcher: 'contains',
        it: 'processes instances initial parameters',
        i: [
          ddry, {
            use: false,
            initial: []
          }, code
        ],
        e: {
          constructors: {
            instance_path: code
          },
          generators: {
            instance_path: {}
          }
        }
      }
    ]);
  };

}).call(this);
