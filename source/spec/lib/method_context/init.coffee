'use strict'

module.exports = (dd) ->
  dd.drive
    it: 'creates method context'
    i: [ dd.helper.f ]
    e:
      code: dd.helper.examples.numbering
      matchers: require '../../../lib/matchers'
      methodName: 'ordinal'
      sharedSpecKeys: dd.helper.f
      specs: false
      tapeContext: null
      use: false
