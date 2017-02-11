'use strict'

module.exports = (dd, that) ->
  dd.drive [
    it: "returns false for driver"
    i: [ 'title', {}, 'name', true ]
    e: false
  ,
    it: "returns false for function module"
    i: [ 'title'
      -> 1
      'name', false ]
    e: false
  ,
    it: "returns trodden part of failing path"
    i: [ 'title'
      deep:
        deep:
          deep:
            inside:
              method: ->
    , 'deep.deep.deep.inside.failure', false ]
    e: [ 'title'
      'deep.deep.deep.inside.failure'
      [ 'deep', 'deep', 'deep', 'inside' ]
      'failure' ]
  ]
