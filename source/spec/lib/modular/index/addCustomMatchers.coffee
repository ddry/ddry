'use strict'

module.exports = (dd) ->
  ddry = dd.helper.ddry()

  dd.drive [
    it: "returns false if no custom matchers specified"
    i: [ ddry, {} ]
    e: false
  ,
    it: "returns false if no valid matchers given"
    i: [ ddry, matchers: 'matcher/failing/path' ]
    e: false
  ,
    it: "adds custom matchers"
    i: [ ddry, matchers: 'spec/examples/code/numbering' ]
    e:
      default: ddry.matchers.default
      anyOrder: ddry.matchers.anyOrder
      contains: ddry.matchers.contains
      error: ddry.matchers.error
      plain: ddry.matchers.plain
      property: ddry.matchers.property
      ordinal: dd.helper.examples.numbering.ordinal
      range: dd.helper.examples.numbering.range
      query: dd.helper.examples.numbering.query
      selector: dd.helper.examples.numbering.selector
  ]
