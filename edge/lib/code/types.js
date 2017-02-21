// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var Context, object;

  object = require('../common/object');

  Context = require('../spec/context');

  module.exports = {
    codeThat: function(dd, name) {
      var constructor, instance, that;
      that = dd.modules[dd.path];
      if (typeof dd.constructors[dd.path] !== 'function') {
        return that;
      }
      name = name.split('.');
      if (name.length === 1) {
        return that;
      }
      constructor = dd.constructors[dd.path];
      instance = that[name[0]];
      if (instance instanceof constructor) {
        return instance;
      }
      return that;
    },
    get: function(params, code) {
      if (params.use) {
        return 'Driver';
      }
      if (this.instanceValid(params, code)) {
        return 'Instance';
      }
      if (typeof code === 'function') {
        return 'Function';
      }
      return 'Module';
    },
    getThat: function(dd, name) {
      var code;
      if (!dd.use) {
        return this.codeThat(dd, name);
      }
      code = dd.driverFactories[dd.path];
      return dd.drivers[dd.path][name] = object.construct(code, []);
    },
    instanceValid: function(params, code) {
      var initials, key, value;
      if (typeof code !== 'function') {
        return false;
      }
      if (Array.isArray(params.initial)) {
        return true;
      }
      if (!(params.initial && typeof params.initial === 'object')) {
        return false;
      }
      initials = object.report(params.initial, true);
      for (key in initials) {
        value = initials[key];
        if (!Array.isArray(value)) {
          return false;
        }
      }
      return true;
    },
    parseInitial: function(code, initials, path) {
      var _, initial, instanceName, instances, obj, obj1, obj2, obj3, obj4;
      if (Array.isArray(initials)) {
        instances = {
          modules: (
            obj = {},
            obj["" + path] = object.construct(code, initials),
            obj
          ),
          instanceNames: (
            obj1 = {},
            obj1["" + path] = {},
            obj1
          )
        };
        return instances;
      }
      instances = {};
      initials = object.report(initials, true);
      for (instanceName in initials) {
        initial = initials[instanceName];
        object.insertKey(instances, instanceName, object.construct(code, initial));
      }
      return _ = {
        modules: (
          obj2 = {},
          obj2["" + path] = instances,
          obj2
        ),
        instanceNames: (
          obj3 = {},
          obj3["" + path] = Object.keys(initials),
          obj3
        ),
        instancesList: (
          obj4 = {},
          obj4["" + path] = instances,
          obj4
        )
      };
    },
    parseTitle: function(title, path) {
      var _;
      if (title && typeof title === 'object') {
        return title;
      }
      return _ = {
        title: title,
        path: path
      };
    },
    processDriver: function(dd, params, code) {
      dd.driverFactories[dd.path] = code;
      dd.drivers[dd.path] = {};
      return dd.generators[dd.path] = {};
    },
    processFunction: function(dd, params, code) {
      dd.modules[dd.path] = code;
      dd.methodName = false;
      dd.generators[dd.path] = new Context(code, false, dd);
      return dd.that = dd.modules[dd.path];
    },
    processInstance: function(dd, params, code) {
      var instances;
      instances = this.parseInitial(code, params.initial, dd.path);
      dd = object.mergeObjects(dd, instances);
      dd.constructors[dd.path] = code;
      dd.generators[dd.path] = {};
      return dd.that = dd.modules[dd.path];
    },
    processModule: function(dd, params, code) {
      dd.modules[dd.path] = code;
      dd.generators[dd.path] = {};
      return dd.that = dd.modules[dd.path];
    },
    setMethodName: function(dd, name) {
      var base;
      if (typeof dd.methodName === 'boolean') {
        return false;
      }
      dd.methodName = name;
      dd.that = this.getThat(dd, name);
      return (base = dd.generators[dd.path])[name] != null ? base[name] : base[name] = new Context(dd.that, name, dd);
    }
  };

}).call(this);
