'use strict'

configurer = require './lib/cli/configurer'

console.log "ddry command line interface"
cli = configurer.load true
configurer.serveSpec cli.constraints
