'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'inserts key deep into object'
    i: [
      one:
        two:
          three:
            four1: 1
            four2: 2
    ,
    'one.two.three.four3'
    3
    ]
    e:
      one:
        two:
          three:
            four1: 1
            four2: 2
            four3: 3
  ]