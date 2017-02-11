'use strict'

helper = require '../../spec_helper'

validModule = 
  title: 'numbering'
  path: 'spec/examples/code/lib/numbering'

module.exports = (dd, that) ->
  ddryWithoutModuleContext = helper.dd()
  dd.drive
    it: "returns false out of module context"
    i: [ ddryWithoutModuleContext, 'ordinal', -> 1 ]
    e: false

  ddry = helper.dd()
  ddry.module validModule, -> 1

  dd.drive [
    it: "returns false for non-existent method name"
    i: [ ddry, 'not.defined.method', -> 1 ]
    e: false
  ,
    it: "returns false for non-existent method specs file"
    i: [ ddry, 'not.defined.method', 'method/specs/file/path' ]
    e: false
  ,
    matcher: 'expectFunction'
    it: "applies given specs to method with given name"
    i: [ ddry, 'ordinal', -> 1 ]
    e: -> 1
  ]
