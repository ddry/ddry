'use strict'

module.exports = (dd) ->
  ddry = dd.helper.ddry()
  ddry.path = 'path'

  dd.drive [
    matcher: 'contains'
    it: 'mounts instances keys to ddry'
    i: [ ddry,
      modules: 'some modules'
      instanceNames: [ 'first', 'second' ]
    ]
    e:
      modules:
        path: 'some modules'
      instanceNames:
        path: [ 'first', 'second' ]
  ]
