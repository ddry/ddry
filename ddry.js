// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  var cli, node, params, shell;

  cli = require('./lib/cli');

  params = process.argv.slice(0);

  shell = params.shift();

  node = params.shift();

  cli(params);

}).call(this);
