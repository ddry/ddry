// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd) {
    var Driver, ddryWithDriver, ddryWithModule;
    ddryWithModule = dd.helper.ddry();
    ddryWithModule.modular({
      outside: {
        module: 'spec/examples/code/lib/numbering'
      }
    });
    dd.drive({
      it: 'returns stored module singleton',
      i: [ddryWithModule, 'set'],
      e: dd.helper.examples.numbering
    });
    ddryWithDriver = dd.helper.ddry();
    ddryWithDriver.modular({
      outside: {
        driver: 'spec/examples/code/lib/instance'
      },
      use: ['driver']
    });
    Driver = dd.helper.examples.instance;
    return dd.drive({
      it: 'returns driver instance',
      i: [ddryWithDriver, 'spec'],
      e: new Driver()
    });
  };

}).call(this);