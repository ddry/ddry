'use strict'

module.exports =
  examples:
    instance:
      folder:
        first: [
          'first folder title'
          'first folder message'
        ]
        second: [
          'second folder title'
          'second folder message'
        ]
      first: [
        'first title'
        'first message'
      ]
      second: [
        'second title'
        'second message'
      ]
  spec:
    context: [
      require './examples/code/numbering'
      'ordinal'
        harness: 'tape'
        instanceNames: {}
        instances: -> {}
        matchers: require '../lib/matchers'
        use: false
    ]
