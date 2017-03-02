// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd) {
    var numberingRewrite;
    numberingRewrite = dd.helper.requireSafe('spec/examples/numbering_rewrite');
    return dd.drive([
      {
        it: "collects matchers module rewriting earlier defined methods",
        i: [['spec/examples/code/numbering', 'spec/examples/code/properties', 'spec/examples/numbering_rewrite']],
        e: {
          ordinal: numberingRewrite.ordinal,
          query: dd.helper.examples.numbering.query,
          selector: numberingRewrite.selector,
          repeatFewTimes: dd.helper.examples.properties.repeatFewTimes,
          setFew: dd.helper.examples.properties.setFew,
          wrapIt: dd.helper.examples.properties.wrapIt,
          deep: {
            deep: {
              deep: {
                inside: {
                  once: dd.helper.examples.properties.deep.deep.deep.inside.once,
                  twice: dd.helper.examples.properties.deep.deep.deep.inside.twice,
                  thrice: dd.helper.examples.properties.deep.deep.deep.inside.thrice
                }
              }
            }
          }
        }
      }
    ]);
  };

}).call(this);
