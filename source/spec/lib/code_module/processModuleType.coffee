'use strict'

helper = require '../../spec_helper'

ddry = helper.dd()
validModule = 
  title: 'numbering'
  path: 'spec/examples/code/lib/numbering'
target = helper.requireSafe validModule

module.exports = (dd) ->
  dd.drive
    it: "processes the target code module"
    i: [ ddry, validModule, target ]
    e: target
