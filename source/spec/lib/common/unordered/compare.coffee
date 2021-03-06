'use strict'

module.exports = (dd, that) ->
  dd.drive [
    it: 'returns clean report if arrays element sets match'
    i: [ [ 1, true, null, 'line' ], [ 'line', null, 1, true  ] ]
    e: that.clean
  ,
    it: 'reports missing values'
    i: [ [ 1, true, null, 'line' ], [ 1, true  ] ]
    e:
      extra: []
      missing: [ null, 'line' ]
  ,
    it: 'reports extra values'
    i: [ [ 1, true, null, 'line' ], [ 1, true, false, null, 'line' ] ]
    e:
      extra: [ false ]
      missing: []
  ,
    it: 'fully reports mismatched values'
    i: [ [ 1, true, null, 'line' ], [ 1, true, false, null ] ]
    e:
      extra: [ false ]
      missing: [ 'line' ]
  ]
