'use strict'

module.exports = (dd) ->
  dd.drive [
    before: ->
      dd.ddryPrefix = process.env.DDRY_PREFIX
      process.env.NPM_ROOT = 'node_modules'
    it: 'sets relative prefix for development environment'
    i: []
    e: true
  ,
    it: 'sets relative prefix for not development environments'
    i: [ true ]
    e: true
    after: ->
      process.env.DDRY_PREFIX = dd.ddryPrefix
  ]
