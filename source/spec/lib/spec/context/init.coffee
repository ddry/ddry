'use strict'

module.exports = (dd) ->
  ddry = dd.helper.ddry()

  dd.drive
    it: 'creates method context'
    i: [ dd.helper.f ]
    e:
      code: dd.helper.examples.numbering
      harness: 'tape'
      instanceNames: {}
      instancesList: {}
      matchers: dd.helper.requireSafe 'lib/matchers'
      methodName: 'ordinal'
      sharedSpecKeys: dd.helper.f
      specs: []
      tapeContext: null
      use: false
