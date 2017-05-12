'use strict'

configurer = require './lib/cli/configurer'

cli = configurer.load true
configurer.serveSpec cli.constraints
