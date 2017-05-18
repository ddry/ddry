'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns path not containing `../` unchanged'
    i: [ './safe/path' ]
    e: './safe/path'
  ,
    it: 'switches 4 levels up path to 2 levels up path'
    i: [ '../../../../spec/config' ]
    e: '../../spec/config'
  ,
    it: 'switches 2 levels up path to 4 levels up path'
    i: [ '../../spec/config' ]
    e: '../../../../spec/config'
  ]
