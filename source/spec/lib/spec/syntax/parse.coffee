'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'collects assertion data of single fixture'
    i: [
      it: dd.helper.message
      data: [
        i: []
        e: undefined
      ]
      from: 1
    , 1,
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
    it: 'collects assertion data by given index of sequence'
    i: [
      it: dd.helper.message
      data: [
        i: []
        e: true
      ,
        i:
          'empty input': []
        e:
          'cool output': undefined
      ,
        i: []
        e: false
      ]
      from: 1
    , 2,
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
  ,
    it: 'fallbacks to index if no input given'
    i: [
      it: dd.helper.message
      data: [ '20th', '21st', '22nd', '23rd' ]
      from: 20
    , 22,
      it: dd.helper.message
      matcher: 'default'
      mochaMethod: 'it'
    ]
    e:
      matcher: 'default'
      message: 'returns 22nd for 22'
      mochaMethod: 'it'
      it: dd.helper.message
      input: [ 22 ]
      expected: '22nd'
  ]
