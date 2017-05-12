'use strict'

module.exports = (dd) ->
  config = 
    some:
      deep:
        array: []

  dd.drive [
    it: 'adds an empty array at given key'
    i: [ {}, 'some.deep.array', '[]' ]
    e: config
  ,
    it: 'adds a value to the array at given key'
    i: [ {}, 'some.deep.array', 1 ]
    e: 
      some:
        deep:
          array: [ 1 ]
  ]

  config = 
    some:
      deep:
        object: {}

  dd.drive [
    it: 'adds an empty object at given key'
    i: [ {}, 'some.deep.object', '{}' ]
    e: config
  ,
    it: 'adds a value at given key'
    i: [ config, 'some.deep.object.and.even.deeper', 'one' ]
    e:
      some:
        deep:
          object:
            and:
              even:
                deeper: 'one'
  ]
