'use strict'

module.exports = (dd) ->
  code = dd.helper.examples.properties

  dd.drive
    before: ->
      code.few = 2
      code.many = 4
    it: 'matches given code module public properties with given values'
    i: [ code, null,
      few: 2
      many: 4
    ]
    e: true
    after: ->
      delete code.few
      delete code.many
