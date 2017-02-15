'use strict'

module.exports = (dd) ->
  dd.drive [
    it: "returns name if required option is not specified"
    i: [ 'option', {}, 'name' ]
    e: 'name'
  ,
    it: "returns name if required option is not specified for given name"
    i: [ 'option',
      option:
        noname: 'value'
    , 'name' ]
    e: 'name'
  ,
    it: "returns specified option value for given name"
    i: [ 'option',
      option:
        name: 'value'
    , 'name' ]
    e: 'value'
  ]
