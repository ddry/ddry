// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    var Instance, ddry;
    ddry = dd.helper.ddry();
    Instance = dd.helper.examples.instance;
    return dd.drive({
      it: "attaches specified helper",
      i: [
        ddry, {
          helper: {
            path: 'spec/examples/code/instance',
            initial: ['title', 'message']
          }
        }
      ],
      e: new Instance('title', 'message')
    });
  };

}).call(this);
