###
# Command line interface error reporter
###

'use strict'

c = require '../common/colors'

module.exports = (message) ->
  console.log "#{c.red 'ERROR:'} #{message}"
  process.exit 1
