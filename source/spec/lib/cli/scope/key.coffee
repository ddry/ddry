'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns module scope'
    i: [ 'only', 'some.module' ]
    e:
      key: 'only'
      value: 'some.module'
  ,
    it: 'returns method scope'
    i: [ 'except', [ 'some.module', 'some.method'] ]
    e:
      key: 'methods.some.module.except'
      value: 'some.method'
  ]
