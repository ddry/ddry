'use strict'

module.exports = (dd) ->
  dd.drive [
    it: "collects matchers module rewriting earlier defined methods"
    i: [ [
      'spec/examples/code/lib/numbering'
      'spec/examples/code/lib/properties'
      'spec/examples/code/lib/numbering_rewrite'
    ] ]
    e:
      ordinal: dd.helper.examples.numbering_rewrite.ordinal
      query: dd.helper.examples.numbering.query
      selector: dd.helper.examples.numbering_rewrite.selector
      mapHash: dd.helper.examples.properties.mapHash
      repeatFewTimes: dd.helper.examples.properties.repeatFewTimes
      wrapIt: dd.helper.examples.properties.wrapIt
      deep:
        deep:
          deep:
            inside:
              once: dd.helper.examples.properties.deep.deep.deep.inside.once
              twice: dd.helper.examples.properties.deep.deep.deep.inside.twice
              thrice: dd.helper.examples.properties.deep.deep.deep.inside.thrice
  ]
