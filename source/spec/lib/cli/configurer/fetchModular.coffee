'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns default modular path for failing config'
    i: []
    e: 'ddry/modular'
  ,
    it: 'returns default modular path for config without `cli` property'
    i: [ {} ]
    e: 'ddry/modular'
  ,
    it: 'returns default modular path for config without `cli.ddry` property'
    i: [
      cli: 'failing'
    ]
    e: 'ddry/modular'
  ,
    it: 'finally fetches configured modular path'
    i: [
      cli:
        ddry: 'configured/modular'
    ]
    e: 'configured/modular'
  ]
