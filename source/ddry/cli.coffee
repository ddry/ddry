'use strict'

helpers = require './lib/cli/helpers'

console.log "ddry command line interface"
cli = helpers.load true
helpers.serveSpec cli.constraints
