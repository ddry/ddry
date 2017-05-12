'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'extracts module title from first block comment'
    i: [ 'lib/cli/titles' ]
    e: 'Command line interface titles parser'
  ]
