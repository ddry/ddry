'use strict'

instance = require '../../helpers/dd_test_instance'
ddry = instance 'path'

module.exports = (dd, that) ->
  dd.drive [
    it: "Returns 'false' for non-existent path"
    i: [ ddry, 'title', 'spec' ]
    e: false
  ]
