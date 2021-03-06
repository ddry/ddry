'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns false unless `cli` config property object found'
    i: [ {} ]
    e: false
  ,
    it: 'returns false unless `cli.config` config property object found'
    i: [
      cli: {}
    ]
    e: false
  ,
    it: 'returns true if `cli.config` config property object found'
    i: [
      cli:
        config: {}
    ]
    e: true
  ]
