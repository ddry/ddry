// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var cli, helpers;

  helpers = require('./lib/cli/helpers');

  console.log("ddry command line instrument");

  cli = helpers.load(true);

  helpers.serveSpec(cli.constraints);

}).call(this);
