'use strict'

cli = require './lib/cli'
helpers = require './lib/cli/helpers'

[ shell, node, params... ] = process.argv
if typeof process.env.DDRY_CLI is 'undefined'
  helpers.serveSpec()
else
  cli params
