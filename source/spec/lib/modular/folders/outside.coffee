'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns single file hash key if file name given'
    i: [ 'selenium', 'ddry-selenium-phantomjs' ]
    e:
      selenium: 'ddry-selenium-phantomjs'
  ,
    it: 'returns folder files hash if folder name given'
    i: [ 'examples', 'spec/examples/code' ]
    e:
      'examples.function_export': 'spec/examples/code/function_export'
      'examples.numbering': 'spec/examples/code/numbering'
      'examples.instance': 'spec/examples/code/instance'
      'examples.properties': 'spec/examples/code/properties'
      'examples.selenium': 'spec/examples/code/selenium'
  ]
