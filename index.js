// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var DataDriven, codeModule, harness, matchers, modular;

  harness = require('./lib/common/harness');

  matchers = require('./lib/matchers');

  codeModule = require('./lib/code');

  modular = require('./lib/modular');

  DataDriven = function(path) {
    this.constructors = {};
    this.driverFactories = {};
    this.drivers = {};
    this.generators = {};
    this.harness = harness();
    this.matchers = matchers;
    this.modules = {};
    this.specs = {};
    this.titles = {};
    this.use = false;
    return this.path = path;
  };

  DataDriven.prototype.muteOutput = function() {
    return modular.muteOutput();
  };

  DataDriven.prototype.modular = function(params) {
    var i, len, module, modules, that;
    this.modularTitle = params.title || 'Modular spec';
    modular.addCustomMatchers(this, params);
    modular.attachHelper(this, params);
    modules = modular.parseModular(this, params);
    that = this;
    modular.setContext(this.harness, 'modular', this.modularTitle, function() {});
    for (i = 0, len = modules.length; i < len; i++) {
      module = modules[i];
      params = [that].concat(codeModule.load.apply(codeModule, module));
      modular.describeModule.apply(codeModule, params);
    }
    return modular.processModular(this);
  };

  DataDriven.prototype.module = function(title, specs) {
    var params;
    params = codeModule.load(this, title, specs);
    return modular.describeModule(this, params, specs);
  };

  DataDriven.prototype.method = function(name, specs) {
    specs = codeModule.setMethod(this, name, specs);
    return modular.describeMethod(this, name, specs);
  };

  DataDriven.prototype.context = function(title, specs) {
    return modular.setContext(this.harness, 'context', title, specs);
  };

  DataDriven.prototype.drive = function(spec) {
    var generator;
    generator = this.generators[this.path];
    if (typeof this.methodName !== 'boolean') {
      generator = generator[this.methodName];
    }
    return generator.init(spec);
  };

  module.exports = DataDriven;

}).call(this);
