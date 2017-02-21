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
