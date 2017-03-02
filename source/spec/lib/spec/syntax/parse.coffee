'use strict'

module.exports = (dd) ->
  singleSequence = 
      it: dd.helper.message
      data: [
        i: []
        e: undefined
      ]
      from: 1
  params =
    it: dd.helper.message
    matcher: 'default'
    mochaMethod: 'it'

  dd.drive
    it: 'collects assertion data of single fixture'
    i: [ singleSequence, 1, params ]
    e:
      matcher: 'default'
      message: 'returns undefined for '
      mochaMethod: 'it'
      it: dd.helper.message
      input: []
      expected: undefined

  sequence =
    it: dd.helper.message
    from: 1
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

  dd.drive
    it: 'collects assertion data by given index of sequence'
    i: [ sequence, 2, params ]
    e:
      matcher: 'default'
      message: 'returns cool output for empty input'
      mochaMethod: 'it'
      it: dd.helper.message
      input: []
      expected: undefined

  valuesSequence =
    it: dd.helper.message
    data: [ '20th', '21st', '22nd', '23rd' ]
    from: 20

  dd.drive
    it: 'fallbacks to index if no input given'
    i: [ valuesSequence, 22, params ]
    e:
      matcher: 'default'
      message: 'returns 22nd for 22'
      mochaMethod: 'it'
      it: dd.helper.message
      input: [ 22 ]
      expected: '22nd'
