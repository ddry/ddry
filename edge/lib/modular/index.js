// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var folder, helpers, mergeHashes, options, testEngine;

  options = require('./options');

  helpers = require('./helpers');

  mergeHashes = require('../common/object').mergeHashes;

  folder = require('../fs/folder');

  testEngine = require('../test/engine');

  module.exports = {
    addCustomMatchers: function(dd, params) {
      var customMatchers;
      if (typeof params.matchers === 'string') {
        params.matchers = [params.matchers];
      }
      if (!Array.isArray(params.matchers)) {
        return false;
      }
      customMatchers = helpers.requireMatchers(params.matchers);
      if (!Object.keys(customMatchers).length) {
        return false;
      }
      return dd.matchers = mergeHashes(dd.matchers, customMatchers);
    },
    attachHelper: function(dd, params) {
      return dd.helper = helpers.attachDDHelper(params.helper);
    },
    describeModule: function(dd, params, specs) {
      if (!params) {
        return false;
      }
      testEngine.describeModule(dd, params, specs);
      return true;
    },
    describeMethod: function(dd, name, specs) {
      if (!specs) {
        return false;
      }
      testEngine.describeMethod(dd, name, specs);
      return true;
    },
    getModuleParams: function(codeModules, moduleName, params) {
      return options.collect(params, moduleName, {
        path: codeModules[moduleName]
      }, ['title:moduleTitles', 'methods', 'initial', ['use']]);
    },
    initCodeModules: function(params) {
      if (params.code == null) {
        return {};
      }
      return folder.read(params.title, params.code, true);
    },
    loadModuleSpecFolder: function(dd, params, specs) {
      var methodList, methodNames, specList;
      methodList = folder.read(params.title, specs, true);
      methodNames = helpers.getFilteredList(methodList, params.methods);
      specList = helpers.filterHash(methodList, methodNames);
      testEngine.runModuleSpecFolder(dd, params.title, specList);
      return true;
    },
    muteOutput: function() {
      return testEngine.muteOutput();
    },
    parseModular: function(dd, params) {
      var codeModules, i, len, moduleName, moduleParams, modules, specModulePaths, specModules;
      codeModules = this.initCodeModules(params);
      codeModules = helpers.addOutsideModules(codeModules, params);
      specModules = helpers.getFilteredList(codeModules, params);
      specModulePaths = helpers.parseSharedSpecs(codeModules, params);
      modules = [];
      for (i = 0, len = specModules.length; i < len; i++) {
        moduleName = specModules[i];
        moduleParams = this.getModuleParams(codeModules, moduleName, params);
        modules.push([dd, moduleParams, specModulePaths[moduleName]]);
      }
      return modules;
    },
    processModular: function(dd) {
      return testEngine.modular(dd);
    },
    setContext: function(harness, type, title, specs) {
      testEngine.sendOutput(harness, type, [title, specs]);
      return true;
    }
  };

}).call(this);
