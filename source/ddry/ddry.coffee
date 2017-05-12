'use strict'

cli = require './lib/cli'

params = process.argv.slice 0
shell = params.shift()
node = params.shift()

cli params
