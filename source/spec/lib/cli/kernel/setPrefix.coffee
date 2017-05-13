'use strict'

module.exports = (dd) ->
  dd.drive [
    before: ->
      dd.ddryPrefix = process.env.DDRY_PREFIX
      process.env.NPM_ROOT = 'node_modules'
    it: 'sets relative prefix for actual environment'
    i: []
    e: true
  ,
    it: 'sets relative prefix for mocked another environments'
    i: [ true ]
    e: true
    after: ->
      process.env.DDRY_PREFIX = dd.ddryPrefix
  ]
