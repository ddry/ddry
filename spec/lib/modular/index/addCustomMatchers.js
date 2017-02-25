// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd) {
    var ddry;
    ddry = dd.helper.ddry();
    return dd.drive([
      {
        it: "returns false if no custom matchers specified",
        i: [ddry, {}],
        e: false
      }, {
        it: "returns false if no valid matchers given",
        i: [
          ddry, {
            matchers: 'matcher/failing/path'
          }
        ],
        e: false
      }, {
        it: "adds custom matchers",
        i: [
          ddry, {
            matchers: 'spec/examples/code/numbering'
          }
        ],
        e: {
          "default": ddry.matchers["default"],
          anyOrder: ddry.matchers.anyOrder,
          contains: ddry.matchers.contains,
          plain: ddry.matchers.plain,
          property: ddry.matchers.property,
          ordinal: dd.helper.examples.numbering.ordinal,
          query: dd.helper.examples.numbering.query,
          selector: dd.helper.examples.numbering.selector
        }
      }
    ]);
  };

}).call(this);
