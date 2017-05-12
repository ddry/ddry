'use strict'

module.exports = (dd) ->
  config =
    cli:
      config:
        path: 'found'
  dd.drive [
    it: 'returns true if stored configurer path found'
    i: [ config, '' ]
    e: true
  ,
    matcher: 'error'
    it: 'throws `configurerMissing` error if path given'
    i: [ {}, 'missing' ]
    e: "#{dd.helper.c.red 'ERROR:'} Failed to load configurer file from #{dd.helper.c.bright 'missing'}"
  ,
    matcher: 'error'
    it: 'throws `configurerUndefined` error otherwise'
    i: [ {} ]
    e: "#{dd.helper.c.red 'ERROR:'} In order to omit configurer path please specify it at least once."
  ]
