'use strict'

module.exports = (dd) ->
  dd.context 'With value given', ->
    config =
      deep:
        inside:
          property: 'value'
    dd.drive
      it: 'returns unchanged config if requested property is not an array'
      i: [ config, 'deep.inside', 'cost' ]
      e: config

    config =
      deep:
        inside:
          property: [ 'value' ]
    dd.drive [
      it: 'returns unchanged config if requested array does not contain given value'
      i: [ config, 'deep.inside.property', 'cost' ]
      e: config
    ,
      it: 'removes given value from requested array'
      i: [ config, 'deep.inside.property', 'value' ]
      e:
        deep:
          inside:
            property: []
    ]

  dd.context 'Without value given', ->
    config =
      deep:
        inside:
          property: [ 'value', 'period' ]
    dd.drive
      it: 'removes requested property'
      i: [ config, 'deep.inside.property' ]
      e:
        deep:
          inside: {}

    config =
      deep:
        inside:
          property: [ 'value', 'period' ]
    dd.drive
      it: 'removes element with requested index from array'
      i: [ config, 'deep.inside.property.1' ]
      e:
        deep:
          inside:
            property: [ 'value' ]
