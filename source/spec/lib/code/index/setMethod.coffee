'use strict'

validModule = 
  title: 'numbering'
  path: 'spec/examples/code/numbering'

module.exports = (dd) ->
  ddryWithoutModuleContext = dd.helper.ddry()
  dd.drive
    it: "returns false out of module context"
    i: [ ddryWithoutModuleContext, 'ordinal', dd.helper.f ]
    e: false

  ddry = dd.helper.ddry()
  ddry.module validModule, dd.helper.f

  dd.drive [
    it: "returns false for non-existent method name"
    i: [ ddry, 'not.defined.method', dd.helper.f ]
    e: false
  ,
    it: "returns false for non-existent specs file of valid method"
    i: [ ddry, 'ordinal', 'method/specs/file/path' ]
    e: false
  ,
    it: "applies given specs to method with given name"
    i: [ ddry, 'ordinal', dd.helper.f ]
    e: dd.helper.f
  ]
