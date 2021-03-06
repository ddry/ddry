// Generated by CoffeeScript 1.12.6

/*
 * Modular spec parsing core
 */

(function() {
  'use strict';
  var attach, folders, helpers, object, options, specFolder, testEngine;

  attach = require('./attach');

  folders = require('./folders');

  helpers = require('./helpers');

  object = require('../common/object');

  options = require('./options');

  specFolder = require('./spec_folder');

  testEngine = require('../test/engine');

  module.exports = {
    addCustomMatchers: function(dd, params) {
      var customMatchers;
      params.matchers = object.toArray(params.matchers, 'string');
      if (!Array.isArray(params.matchers)) {
        return false;
      }
      customMatchers = attach.matchers(params.matchers);
      if (!Object.keys(customMatchers).length) {
        return false;
      }
      return dd.matchers = object.extend(dd.matchers, customMatchers);
    },
    applyContext: function(dd, spec, data) {
      return function() {
        return spec.apply(dd.that, data);
      };
    },
    attachHelper: function(dd, params) {
      return dd.helper = attach.helper(params.helper);
    },
    describeMethod: function(dd, name, specs) {
      if (!specs) {
        return false;
      }
      testEngine.describeMethod(dd, name, specs);
      return true;
    },
    describeModule: function(dd, params, specs) {
      if (!params) {
        return false;
      }
      testEngine.describeModule(dd, params, specs);
      return true;
    },
    loadModuleSpecFolder: function(dd, params, specs) {
      var methodList, methodNames, specList;
      methodList = folders.read(params.title, specs, true);
      methodNames = helpers.getFilteredList(methodList, params.methods);
      specList = helpers.filterHash(methodList, methodNames);
      specFolder.run(dd, params.title, specList);
      return true;
    },
    muteOutput: function() {
      return testEngine.muteOutput();
    },
    parseModular: function(dd, params) {
      var codeModules, i, len, moduleName, moduleParams, modules, specModulePaths, specModules;
      codeModules = folders.initCodeModules(params);
      codeModules = attach.outside(codeModules, params);
      params = helpers.applyHarnessScope(dd, params);
      specModules = helpers.getFilteredList(codeModules, params);
      specModulePaths = helpers.parseSharedSpecs(codeModules, params);
      modules = [];
      for (i = 0, len = specModules.length; i < len; i++) {
        moduleName = specModules[i];
        moduleParams = options.getModuleParams(codeModules, moduleName, params);
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
