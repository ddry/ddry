'use strict'

helper = require '../../spec_helper'

validModule = 
  title: 'numbering'
  path: 'spec/examples/code/lib/numbering'
ddry = helper.dd()
ddry.module validModule

module.exports = (dd, that) ->
  dd.drive
    it: "applies given specs to method with given name"
    i: [ ddry, 'ordinal', -> 1 ]
    e: -> 1
