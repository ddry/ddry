'use strict'

module.exports = (dd) ->
  object =
    one1: -> 1
    one2:
      two21: [
        one: 1
      ,
        two:
          two: 2
      ,
        three:
          three:
            three: 3
      ]
    one3: []
  dd.drive [
    it: 'returns object report as array'
    i: [ object ]
    e: [
      "one1": -> 1
    ,
      "one2.two21.0.one": 1
    ,
      "one2.two21.1.two.two": 2
    ,
      "one2.two21.2.three.three.three": 3
    ,
      "one3": ''
    ]
  ,
    it: 'returns object report as hash'
    i: [ object, true ]
    e:
      "one1": -> 1
      "one2.two21.0.one": 1
      "one2.two21.1.two.two": 2
      "one2.two21.2.three.three.three": 3
      "one3": ''
  ]
