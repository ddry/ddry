'use strict'

module.exports = (dd) ->
  instance = dd.helper.requireSafe 'spec/examples/code/lib/instance'

  dd.drive [
    it: "recognizes driver by 'use' parameter"
    i: [ use: true ]
    e: 'Driver'
  ,
    it: "recognizes instance by 'initial' array parameter"
    i: [
      initial: []
    , instance ]
    e: 'Instance'
  ,
    it: 'recognizes function module export'
    i: [ {}, instance ]
    e: 'Function'
  ,
    it: 'recognizes object module export'
    i: [ {}, {} ]
    e: 'Module'
  ]
