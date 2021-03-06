// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        it: "returns unchanged modules list if no outside param given",
        i: [
          {
            one: 1
          }, {
            code: 'code'
          }
        ],
        e: {
          one: 1
        }
      }, {
        it: "returns unchanged modules list if outside param is null",
        i: [
          {
            one: 1
          }, {
            outside: null
          }
        ],
        e: {
          one: 1
        }
      }, {
        it: "returns unchanged modules list if outside param is empty",
        i: [
          {
            one: 1
          }, {
            outside: {}
          }
        ],
        e: {
          one: 1
        }
      }, {
        it: "adds specified outside modules",
        i: [
          {
            code_one: 'lib/code_one',
            code_two: 'lib/code_two'
          }, {
            outside: {
              index: 'index',
              helper: 'helper'
            }
          }
        ],
        e: {
          code_one: 'lib/code_one',
          code_two: 'lib/code_two',
          index: 'index',
          helper: 'helper'
        }
      }, {
        it: "overwrites input modules with outside ones",
        i: [
          {
            code_one: 'lib/code_one',
            code_two: 'lib/code_two'
          }, {
            outside: {
              index: 'index',
              code_two: 'code_two'
            }
          }
        ],
        e: {
          code_one: 'lib/code_one',
          code_two: 'code_two',
          index: 'index'
        }
      }
    ]);
  };

}).call(this);
