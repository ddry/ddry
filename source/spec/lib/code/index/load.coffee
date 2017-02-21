'use strict'

validModule = 
  title: 'numbering'
  path: 'spec/examples/code/numbering'

module.exports = (dd) ->
  ddry = dd.helper.ddry()

  dd.drive [
    it: "returns 'false' for non-existent path"
    i: [ ddry, 'title', 'spec' ]
    e: false
  ,
    it: "delegates processing of specified module spec folder"
    i: [ ddry, validModule, 'spec/file/path' ]
    e: false
  ,
    it: "loads valid module"
    i: [ ddry, validModule, dd.helper.f ]
    e: validModule
  ]
