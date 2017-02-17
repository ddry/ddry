// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd, that) {
    if (typeof describe === 'function') {
      before(function() {
        return that.container = '';
      });
      after(function() {
        return delete that.container;
      });
      return context("with 'az'", function() {
        beforeEach(function() {
          return that.container += 'a';
        });
        afterEach(function() {
          return that.container += 'z';
        });
        return context("with 'by'", function() {
          beforeEach(function() {
            return that.container += 'b';
          });
          afterEach(function() {
            return that.container += 'y';
          });
          return context("with 'cx'", function() {
            beforeEach(function() {
              return that.container += 'c';
            });
            afterEach(function() {
              return that.container += 'x';
            });
            return dd.drive([
              {
                it: "wraps '1'",
                i: [1],
                e: 'abc|1|'
              }, {
                it: "wraps '1' again",
                i: [2],
                e: 'abc|1|xyzabc|2|'
              }, {
                it: "wraps '1' again and again",
                i: [3],
                e: 'abc|1|xyzabc|2|xyzabc|3|'
              }
            ]);
          });
        });
      });
    } else {
      that.container = '';
      return dd.drive([
        {
          before: function() {
            return that.container += 'abc';
          },
          after: function() {
            return that.container += 'xyz';
          }
        }, {
          it: "wraps '1'",
          i: [1],
          e: 'abc|1|'
        }, {
          it: "wraps '1' again",
          i: [2],
          e: 'abc|1|xyzabc|2|'
        }, {
          it: "wraps '1' again and again",
          i: [3],
          e: 'abc|1|xyzabc|2|xyzabc|3|',
          after: function() {
            return delete that.container;
          }
        }
      ]);
    }
  };

}).call(this);