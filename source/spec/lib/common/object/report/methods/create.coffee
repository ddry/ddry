'use strict'

module.exports = (dd) ->
  object =
    one: 1
    two: 2
    prop:
      one: dd.helper.f
      two: dd.helper.ff

  dd.ry
    raw:
      context: 'With raw output requested'
      it: 'returns raw values report'
      i: [ object, null, null, true ]
      e: [
        'one': 1
      ,
        'two': 2
      ,
        'prop.one': dd.helper.f
      ,
        'prop.two': dd.helper.ff
      ]
    formatted:
      context: 'With formatted output requested'
      it: 'returns formatted report'
      i: [ object, null, null ]
      e: [
        'one: 1'
        'two: 2'
        "prop.one: #{dd.helper.format dd.helper.f}"
        "prop.two: #{dd.helper.format dd.helper.ff}"
      ]
