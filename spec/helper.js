// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var SpecHelper;

  SpecHelper = function(harness, subject, relative) {
    var j, len, name, object, ref, tape;
    this.prefix = relative;
    this.dataDriven = require(subject + "index");
    this.forMocha = require(subject + "lib/common/harness").forMocha;
    this.methodContext = require(subject + "lib/spec/context");
    this.requireSafe = require(subject + "lib/fs/require_safe");
    object = require(subject + "lib/common/object");
    object.extend(this, object);
    if (this.forMocha()) {
      this.tapeRunner = require(subject + "lib/test/tap");
      tape = require('tape');
      tape.createStream({
        objectMode: true
      }).on('data', function(row) {
        return false;
      });
      tape.test('cover', function(t) {
        t.deepEqual(1, 1);
        return t.end();
      });
    }
    this.requireSafe({
      prefix: this.prefix
    });
    this.examples = {};
    ref = ['function_export', 'instance', 'numbering', 'properties'];
    for (j = 0, len = ref.length; j < len; j++) {
      name = ref[j];
      this.examples[name] = this.requireSafe("spec/examples/code/" + name);
    }
    this.ddry();
    return true;
  };

  SpecHelper.prototype.ddry = function() {
    var DataDriven, ddry;
    DataDriven = this.dataDriven;
    ddry = new DataDriven();
    ddry.module({
      prefix: this.prefix
    });
    ddry.muteOutput();
    return ddry;
  };

  SpecHelper.prototype.tapStub = require('assert');

  SpecHelper.prototype.tapStub.skip = function() {
    return 1;
  };

  SpecHelper.prototype.f = function() {
    return 1;
  };

  SpecHelper.prototype.ff = function() {
    return 2;
  };

  SpecHelper.prototype.same = function(input) {
    return input;
  };

  SpecHelper.prototype.oops = function() {
    throw new Error('oops!');
  };

  SpecHelper.prototype.message = function(i, e) {
    return "returns " + e + " for " + i;
  };

  module.exports = SpecHelper;

}).call(this);
