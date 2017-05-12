'use strict'

module.exports = (dd) ->
  dd.drive [
    before: ->
      process.env.DDRY_CLI = 'cli.js'
    it: 'renders and applies CLI scope'
    i: [ [ '-o', 'spec/lib/cli/kernel/' ] ]
    e: true
  ]
