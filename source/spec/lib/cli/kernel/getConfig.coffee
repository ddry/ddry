'use strict'

module.exports = (dd) ->
  config = dd.helper.io.load()
  dd.drive [
    it: 'returns empty object for not getting config commands'
    i: [ 'init' ]
    e: {}
  ,
    it: 'returns config object otherwise'
    i: [ 'add' ]
    e: config
  ]
