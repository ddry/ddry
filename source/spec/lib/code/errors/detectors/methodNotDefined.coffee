'use strict'

module.exports = (dd) ->
  dd.drive [
    it: "returns false for driver"
    i: [ 'title', {}, 'name', true ]
    e: false
  ,
    it: "returns false for function module"
    i: [ 'title', dd.helper.f, 'name', false ]
    e: false
  ,
    it: "returns false for defined method"
    i: [ 'title'
      method:
        defined:
          somewhere: dd.helper.f
    , 'method.defined.somewhere', false ]
    e: false
  ,
    it: "returns parameters of invalid method"
    i: [ 'title'
      property:
        defined:
          somewhere: 1
    , 'property.defined.somewhere', false ]
    e: [ 'title', 'property.defined.somewhere' ]
  ]
