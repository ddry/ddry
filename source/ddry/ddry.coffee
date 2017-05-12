'use strict'

cli = require './lib/cli'

[ shell, node, params... ] = process.argv
cli params
