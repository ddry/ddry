'use strict'

module.exports = (dd) ->
  dd.drive
    before: ->
      delete process.env.DDRY_CLI
    it: 'returns'
    i: [ true ]
    e: {}
