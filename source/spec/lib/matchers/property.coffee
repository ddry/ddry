'use strict'

module.exports = (dd) ->
  code = dd.helper.examples.properties

  dd.drive [
    before: ->
      code.few = 2
      code.many = 4
    after: ->
      delete code.few
      delete code.many
  ,
    it: 'matches given code module single public property with given value'
    i: [ code, null,
      few: 2
    ]
    e: true
  ,
    it: 'matches given code module multiple public properties with given values'
    i: [ code, null,
      few: 2
      many: 4
    ]
    e: true
  ,
    it: 'and shows the power of shared spec params'
    i: [ code, null,
      many: 4
    ]
    e: true
  ]
