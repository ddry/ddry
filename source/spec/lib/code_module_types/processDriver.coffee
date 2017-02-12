'use strict'

helper = require '../../spec_helper'

ddry = helper.dd()
instance = helper.requireSafe 'spec/examples/code/lib/instance'

module.exports = (dd) ->
  dd.drive
    it: 'returns empty generators hash'
    i: [ ddry, null, instance ]
    e: {}
