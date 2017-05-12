'use strict'

cli = require './lib/cli'
configurer = require './lib/cli/configurer'

[ shell, node, params... ] = process.argv
if typeof process.env.DDRY_CLI is 'undefined'
  process.env.DDRY_CLI = 'cli.js'
  configurer.serveSpec()
else
  cli params
