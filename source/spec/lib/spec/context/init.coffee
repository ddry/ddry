'use strict'

module.exports = (dd) ->
  ddry = dd.helper.ddry()
  code = dd.helper.examples.numbering

  dd.drive
    it: 'creates method context'
    i: [ dd.helper.f ]
    e:
      code: code
      root: code
      that: code
      harness: 'tape'
      instanceNames: {}
      instancesList: {}
      matchers: dd.helper.requireSafe 'lib/matchers'
      methodName: 'ordinal'
      sharedSpecKeys: dd.helper.f
      specs: []
      tapContext: null
      use: false
