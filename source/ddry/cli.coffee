'use strict'

helpers = require './lib/cli/helpers'
object = require './lib/common/object'

console.log "ddry command line instrument in development"
cli = helpers.load true
helpers.serveSpec cli.constraints
