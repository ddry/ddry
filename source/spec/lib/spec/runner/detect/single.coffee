'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns false if assertion input data missing'
    i: [ e: true ]
    e: false
  ,
    it: 'returns false if assertion input data invalid'
    i: [ i: false ]
    e: false
  ,
    it: 'returns false if assertion expected data missing'
    i: [ i: [ 'data' ] ]
    e: false
  ,
    it: 'returns true if input for plain matcher provided'
    i: [
      matcher: 'plain'
      i: undefined
      e: undefined
    ]
    e: true
  ,
    it: 'returns true if assertion data intact'
    i: [
      i: [ 'data' ]
      e: true
    ]
    e: true
  ]
