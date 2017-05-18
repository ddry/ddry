'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns fallback path for ddry source `require`'
    i: [ '../../../../spec/examples/spec/muteTape/spec' ]
    e: "#{dd.helper.prefix}spec/examples/spec/muteTape/spec"
  ,
    it: 'returns false for utterly failing paths'
    i: [ '../../../utterly/failing/path' ]
    e: false
  ]
