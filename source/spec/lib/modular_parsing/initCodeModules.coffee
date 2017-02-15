'use strict'

module.exports = (dd) ->
  dd.drive [
    it: "inits empty files hash if no code folder given"
    i: [ {} ]
    e: {}
  ,
    it: "returns code folder file list"
    i: [
      title: 'title'
      code: 'spec/examples/code/lib'
    ]
    e:
      function_export: 'spec/examples/code/lib/function_export'
      instance: 'spec/examples/code/lib/instance'
      numbering: 'spec/examples/code/lib/numbering'
      numbering_rewrite: 'spec/examples/code/lib/numbering_rewrite'
      properties: 'spec/examples/code/lib/properties'
      test_singleton: 'spec/examples/code/lib/test_singleton'
  ]