// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var cli, configurer, node, params, ref, shell,
    slice = [].slice;

  cli = require('./lib/cli');

  configurer = require('./lib/cli/configurer');

  ref = process.argv, shell = ref[0], node = ref[1], params = 3 <= ref.length ? slice.call(ref, 2) : [];

  if (typeof process.env.DDRY_CLI === 'undefined') {
    process.env.DDRY_CLI = 'cli.js';
    configurer.serveSpec();
  } else {
    cli(params);
  }

}).call(this);
