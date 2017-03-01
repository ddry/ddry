'use strict'

module.exports = (dd) ->
  dd.drive [
    before: ->
      @.messageGenerator = dd.helper.message
    it: 'composes assertion message with its data if no aliases given'
    i: [
      i: []
      e: undefined
    ,
      it: dd.helper.message
      matcher: 'default'
      mochaMethod: 'it'
    ]
    e:
      matcher: 'default'
      message: 'returns undefined for '
      mochaMethod: 'it'
      it: dd.helper.message
      input: []
      expected: undefined
  ,
    it: 'composes assertion message with data aliases if given'
    i: [
      i:
        'empty input': []
      e:
        'cool output': undefined
    ,
      it: dd.helper.message
      matcher: 'default'
      mochaMethod: 'it'
    ]
    e:
      matcher: 'default'
      message: 'returns cool output for empty input'
      mochaMethod: 'it'
      it: dd.helper.message
      input: []
      expected: undefined
  ]
