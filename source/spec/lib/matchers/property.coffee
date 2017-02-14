'use strict'

module.exports = (dd) ->
  code = dd.helper.requireSafe 'spec/examples/code/lib/properties'
  code.few = 2
  code.many = 4

  dd.drive
    it: 'matches given code module public properties with given values'
    i: [ code, null,
      few: 2
      many: 4
    ]
    e: true
