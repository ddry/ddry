'use strict'

module.exports = (dd) ->
  list = 
    one: 1
    two: 2
    three: 3
    four: 4
    five: 5

  dd.drive [
    it: "returns list keys if no params given"
    i: [ list ]
    e: [ 'one', 'two', 'three', 'four', 'five' ]
  ,
    it: "returns only existing keys specified as 'only'"
    i: [ list, only: [ 'one', 'four', 'seven', 'nine' ] ]
    e: [ 'one', 'four' ]
  ,
    it: "returns list keys if no only/except modifiers given"
    i: [ list, {} ]
    e: [ 'one', 'two', 'three', 'four', 'five' ]
  ,
    it: "returns only keys not specified as 'except'"
    i: [ list, except: [ 'one', 'three', 'five', 'seven', 'nine' ] ]
    e: [ 'two', 'four' ]
  ]
