'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'sets ddry development CLI for development environment'
    i: [ 'true' ]
    e: 'cli.js'
  ,
    it: 'sets ddry CLI for actual environment with npmRoot set'
    i: [ null, 'npmRoot' ]
    e: 'npmRoot/ddry/cli.js'
  ,
    it: 'sets ddry CLI for actual environment with default npmRoot'
    i: []
    e: 'node_modules/ddry/cli.js'
  ]
