// Generated by CoffeeScript 2.4.1
(function() {
  'use strict';
  module.exports = function(dd) {
    var MethodContext, ddryWithFunction, ddryWithModule;
    MethodContext = dd.helper.methodContext;
    ddryWithFunction = dd.helper.ddry();
    ddryWithFunction.modular({
      outside: {
        module: 'spec/examples/code/function_export'
      }
    });
    dd.drive({
      it: 'returns false for function module export',
      i: [ddryWithFunction, 'name'],
      e: false
    });
    ddryWithModule = dd.helper.ddry();
    ddryWithModule.modular({
      outside: {
        module: 'spec/examples/code/numbering'
      }
    });
    return dd.drive({
      it: 'sets context for module method',
      i: [ddryWithModule, 'ordinal'],
      e: new MethodContext(ddryWithModule.that, 'ordinal', ddryWithModule)
    });
  };

}).call(this);
