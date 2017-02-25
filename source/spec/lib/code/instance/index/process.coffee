'use strict'

module.exports = (dd) ->
  ddry = dd.helper.ddry()
  ddry.path = 'instance_path'
  code = dd.helper.examples.instance

  dd.drive [
    matcher: 'contains'
    it: 'processes instances initial parameters'
    i: [ ddry,
      use: false
      initial: []
    , code ]
    e:
      constructors:
        instance_path: code
      generators:
        instance_path: {}
  ]
