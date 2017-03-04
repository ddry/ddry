'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns empty array if no input given'
    i: []
    e: []
  ,
    it: 'returns value unchanged if array given'
    i: [ [ 'input' ] ]
    e: [ 'input' ]
  ,
    matcher: 'anyOrder'
    it: 'returns object keys if object given'
    i: [
      one: 1
      two: 2
      six: 6
    ]
    e: [ 'two', 'six', 'one' ]
  ,
    it: 'wraps value with array if no value types given'
    i: [ 1 ]
    e: [ 1 ]
  ,
    it: 'wraps value with array if value type matches given types'
    i: [ 'input', 'string' ]
    e: [ 'input' ]
  ,
    it: 'returns value if value type does not match given types'
    i: [ 'input', 'number' ]
    e: 'input'
  ,
    it: 'supports rejection with multiple types'
    i: [ 'input', [ 'number', 'boolean' ] ]
    e: 'input'
  ,
    it: 'supports acception with multiple types'
    i: [ 'input', [ 'number', 'boolean', 'string' ] ]
    e: [ 'input' ]
  ]
