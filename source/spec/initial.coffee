'use strict'

module.exports =
  examples:
    instance:
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
        matchers: require '../lib/matchers'
        use: false
    ]
