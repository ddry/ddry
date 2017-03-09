// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var initial, run_cli;

  run_cli = require('./run_cli');

  initial = require('./initial');

  module.exports = function(harness, subject) {
    return run_cli(harness, subject, {
      title: subject + " by " + harness,
      matchers: 'ddry-selenium-matchers',
      initial: initial,
      use: 'examples.selenium',
      harness: {
        tap: {
          except: 'examples.selenium'
        }
      },
      except: ['fs.require_safe_core', 'fs.folder', 'matchers.get_actual', 'modular_wrapper', 'spec.runner.index', 'test.outputs', 'test.tap', 'test.tap_spec']
    });
  };

}).call(this);
