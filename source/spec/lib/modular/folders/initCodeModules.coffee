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
      code: 'spec/examples/code'
    ]
    e:
      function_export: 'spec/examples/code/function_export'
      instance: 'spec/examples/code/instance'
      numbering: 'spec/examples/code/numbering'
      properties: 'spec/examples/code/properties'
      selenium: 'spec/examples/code/selenium'
  ]
