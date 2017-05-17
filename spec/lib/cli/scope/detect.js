// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    var item, methodPaths, modulePaths, specPath;
    item = 'spec/lib/successful/module/method.js';
    modulePaths = {
      'successful.module': 'lib/successful/module'
    };
    methodPaths = ['successful.module'];
    specPath = new RegExp('^spec/lib/');
    dd.drive({
      it: 'returns method if found',
      i: [item, modulePaths, methodPaths, specPath],
      e: ['successful.module', 'method']
    });
    item = 'lib/successful/module';
    dd.drive({
      it: 'returns module if found',
      i: [item, modulePaths, methodPaths, specPath],
      e: 'successful.module'
    });
    item = 'lib/successful/';
    dd.drive({
      it: 'returns folder if found',
      i: [item, modulePaths, methodPaths, specPath],
      e: 'successful'
    });
    item = 'lib/failing/';
    return dd.drive({
      it: 'returns false for failing items',
      i: [item, modulePaths, methodPaths, specPath],
      e: false
    });
  };

}).call(this);
