'use strict'

module.exports = (dd) ->
  item = 'spec/lib/successful/module/method.js'
  modulePaths =
    'successful.module': 'lib/successful/module'
  methodPaths = 
    [ 'successful.module' ]
  specPath = new RegExp '^spec/lib/'

  dd.drive
    it: 'returns method if found'
    i: [ item, modulePaths, methodPaths, specPath ]
    e: [ 'successful.module', 'method' ]

  item = 'lib/successful/module'
  dd.drive
    it: 'returns module if found'
    i: [ item, modulePaths, methodPaths, specPath ]
    e: 'successful.module'

  item = 'lib/successful/'
  dd.drive
    it: 'returns folder if found'
    i: [ item, modulePaths, methodPaths, specPath ]
    e: 'successful'

  item = 'lib/failing/'
  dd.drive
    it: 'returns false for failing items'
    i: [ item, modulePaths, methodPaths, specPath ]
    e: false
