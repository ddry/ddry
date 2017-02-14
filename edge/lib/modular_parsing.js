// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var helpers, readFolderFiles, testEngine;

  helpers = require('./modular_helpers');

  readFolderFiles = require('./read_folder_files');

  testEngine = require('./test_engine');

  module.exports = {
    muteOutput: function() {
      return testEngine.muteOutput();
    },
    addCustomMatchers: function(dd, params) {
      var customMatchers;
      if (typeof params.matchers === 'string') {
        params.matchers = [params.matchers];
      }
      if (!Array.isArray(params.matchers)) {
        return;
      }
      customMatchers = helpers.requireMatchers(params.matchers);
      if (!customMatchers) {
        return;
      }
      return dd.matchers = helpers.mergeHashes(dd.matchers, customMatchers);
    },
    attachHelper: function(dd, params) {
      return dd.helper = helpers.attachDDHelper(params.helper);
    },
    processModular: function(dd) {
      return testEngine.modular(dd);
    },
    parseModular: function(dd, params) {
      var codeModules, i, initial, len, moduleName, moduleParams, modules, specModulePaths, specModules;
      codeModules = this.initCodeModules(params);
      codeModules = helpers.addOutsideModules(codeModules, params);
      specModules = helpers.getFilteredList(codeModules, params);
      specModulePaths = helpers.parseSharedSpecs(codeModules, params);
      modules = [];
      for (i = 0, len = specModules.length; i < len; i++) {
        moduleName = specModules[i];
        moduleParams = {
          title: helpers.getOption('moduleTitles', params, moduleName),
          path: codeModules[moduleName],
          methods: helpers.getOption('methods', params, moduleName)
        };
        initial = helpers.getOption('initial', params, moduleName);
        if (Array.isArray(initial)) {
          moduleParams.initial = initial;
        }
        moduleParams.use = helpers.getSetOption('use', params, moduleName);
        modules.push([dd, moduleParams, specModulePaths[moduleName]]);
      }
      return modules;
    },
    initCodeModules: function(params) {
      if (params.code == null) {
        return {};
      }
      return readFolderFiles(params.title, params.code);
    },
    loadModuleSpecFolder: function(dd, params, specs) {
      var methodList, methodNames, specList;
      methodList = readFolderFiles(params.title, specs, true);
      methodNames = helpers.getFilteredList(methodList, params.methods);
      specList = helpers.filterHash(methodList, methodNames);
      return testEngine.runModuleSpecFolder(dd, params.title, specList);
    },
    describeModule: function(dd, params, specs) {
      if (params) {
        return testEngine.describeModule(dd, params, specs);
      }
    },
    describeMethod: function(dd, name, specs) {
      if (specs) {
        return testEngine.describeMethod(dd, name, specs);
      }
    },
    setContext: function(type, title, specs) {
      return testEngine.sendOutput(type, [title, specs]);
    }
  };

}).call(this);
