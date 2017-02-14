// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var SpecHelper;

  SpecHelper = function(helperPrefix, requirePrefix) {
    this.prefix = requirePrefix;
    this.dataDriven = require(helperPrefix + "index");
    this.methodContext = require(helperPrefix + "lib/method_context");
    this.requireSafeProxy = require(helperPrefix + "lib/require_safe");
    this.ddry();
    return true;
  };

  SpecHelper.prototype.ddry = function(path) {
    var DataDriven, ddry;
    if (path == null) {
      path = '';
    }
    DataDriven = this.dataDriven;
    ddry = new DataDriven(path);
    ddry.module({
      prefix: this.prefix
    });
    ddry.muteOutput();
    return ddry;
  };

  SpecHelper.prototype.requireSafe = function(params) {
    this.requireSafeProxy({
      prefix: this.prefix
    });
    return this.requireSafeProxy(params);
  };

  SpecHelper.prototype.tapeStub = require('assert');

  SpecHelper.prototype.mergeHashes = function(lo, hi) {
    var key, value;
    for (key in hi) {
      value = hi[key];
      lo[key] = value;
    }
    return lo;
  };

  SpecHelper.prototype.f = function() {
    return 1;
  };

  SpecHelper.prototype.ff = function() {
    return 2;
  };

  module.exports = SpecHelper;

}).call(this);
