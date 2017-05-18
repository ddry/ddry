'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'sets relative prefix for default environment'
    i: []
    e: '../../../../'
  ,
    it: 'sets relative prefix for CLI development environment'
    i: [ '' ]
    e: '../../'
  ,
    it: 'sets relative prefix for complex NPM root'
    i: [ null, 'some/other/node/modules/location' ]
    e: '../../../../../../../../'
  ]
