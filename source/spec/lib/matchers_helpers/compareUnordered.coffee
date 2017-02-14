'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'checks array element values ignoring order'
    i: [ [ 1, 2 ], [ 2, 1 ] ]
    e:
      extra: []
      missing: []
  ,
    it: 'finds missing elements'
    i: [ [ 1, 2 ], [ 2 ] ]
    e:
      extra: []
      missing: [ 1 ]
  ,
    it: 'finds extra elements'
    i: [ [ 1, 2 ], [ 2, 1, 3 ] ]
    e:
      extra: [ 3 ]
      missing: []
  ,
    it: 'finds extra and missing elements'
    i: [ [ 1, 2 ], [ 2, 3 ] ]
    e:
      extra: [ 3 ]
      missing: [ 1 ]
  ]
