'use strict'

module.exports = (dd) ->
  numberingRewrite = dd.helper.requireSafe 'spec/examples/numbering_rewrite'
  dd.drive [
    it: "collects matchers module rewriting earlier defined methods"
    i: [ [
      'spec/examples/code/lib/numbering'
      'spec/examples/code/lib/properties'
      'spec/examples/numbering_rewrite'
    ] ]
    e:
      ordinal: numberingRewrite.ordinal
      query: dd.helper.examples.numbering.query
      selector: numberingRewrite.selector
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
