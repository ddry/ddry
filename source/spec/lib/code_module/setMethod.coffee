'use strict'

helper = require '../../spec_helper'

validModule = 
  title: 'numbering'
  path: 'spec/examples/code/lib/numbering'

module.exports = (dd, that) ->
  ddryWithoutModuleContext = helper.dd()
  dd.drive
    it: "returns false out of module context"
    i: [ ddryWithoutModuleContext, 'ordinal', helper.f ]
    e: false

  ddry = helper.dd()
  ddry.module validModule, helper.f

  dd.drive [
    it: "returns false for non-existent method name"
    i: [ ddry, 'not.defined.method', helper.f ]
    e: false
  ,
    it: "returns false for non-existent specs file of valid method"
    i: [ ddry, 'ordinal', 'method/specs/file/path' ]
    e: false
  ,
    matcher: 'expectFunction'
    it: "applies given specs to method with given name"
    i: [ ddry, 'ordinal', helper.f ]
    e: helper.f
  ]
