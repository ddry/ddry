'use strict'

helper = require '../../spec_helper'
ddry = helper.dd()
validModule = 
  title: 'numbering'
  path: 'spec/examples/code/lib/numbering'

module.exports = (dd, that) ->
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
    i: [ ddry, validModule, -> 1 ]
    e: validModule
  ]
