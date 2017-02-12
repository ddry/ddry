'use strict'

helper = require '../../spec_helper'

instance = helper.requireSafe 'spec/examples/code/lib/instance'

module.exports = (dd) ->
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
