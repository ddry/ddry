'use strict'

numbering = require '../../../examples/code/numbering'

module.exports = (dd) ->
  dd.drive [
    it: 'sets require relative prefix'
    i: [ { prefix: dd.helper.prefix } ]
    e: false
  ,
    it: 'returns false for non-existent filename'
    i: [
      title: 'Module exporting non-object'
      path: 'spec/file/path'
    ]
    e: false
  ,
    it: 'returns false for non-object module export'
    i: [
      title: 'Module exporting non-object'
      path: 'spec/examples/non_object'
    ]
    e: false
  ,
    it: 'returns false for empty object module export'
    i: [
      title: 'Module exporting empty object'
      path: 'spec/examples/empty_object'
    ]
    e: false
  ,
    it: 'loads valid code module'
    i: [
      title: 'Module exporting empty object'
      path: 'spec/examples/code/numbering'
    ]
    e: numbering
  ]
  