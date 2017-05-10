'use strict'

module.exports = (dd) ->
  functionCode = dd.helper.examples.function_export
  dd.drive [
    it: "returns module with function export"
    i: [ functionCode ]
    e: functionCode
  ,    
    it: "returns false for invalid module exports"
    i: [ null ]
    e: false
  ]
  code = dd.helper.examples.properties
  dd.drive [
    it: 'returns simple-named module method'
    i: [ code, 'repeatFewTimes' ]
    e: code.repeatFewTimes
  ,
    it: 'returns failed trodden path to method'
    i: [ code, 'deep.deep.deep.somewhere.else' ]
    e: [ [ 'deep', 'deep', 'deep' ], 'somewhere' ]
  ,
    it: 'returns valid trodden path to object'
    i: [ code, 'deep.deep.deep.inside', false ]
    e: [ [ 'deep', 'deep', 'deep' ], 'inside' ]
  ,
    it: 'returns method by dot-notated name'
    i: [ code, 'deep.deep.deep.inside.once' ]
    e: code.deep.deep.deep.inside.once
  ]
  object =
    some:
      deep:
        name: 'name'
  dd.drive [
    it: 'returns the object and top level key if requested'
    i: [ object, 'some', true, true ]
    e: [ object, 'some', [] ]
  ,
    it: 'returns the object node and the following key if requested'
    i: [ object, 'some.deep', true, true ]
    e: [ object.some, 'deep', [ 'some' ] ]
  ,
    it: 'and goes this way even deeper'
    i: [ object, 'some.deep.name', true, true ]
    e: [ object.some.deep, 'name', [ 'some', 'deep' ] ]
  ]