// Generated by CoffeeScript 2.4.1
(function() {
  'use strict';
  module.exports = function(dd, that) {
    if (dd.helper.forMocha()) {
      context('With Mocha hooks', function() {
        before(function() {
          return that.container = '';
        });
        after(function() {});
        delete that.container;
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
                },
                {
                  it: "wraps '1' again",
                  i: [2],
                  e: 'abc|1|xyzabc|2|'
                },
                {
                  it: "wraps '1' again and again",
                  i: [3],
                  e: 'abc|1|xyzabc|2|xyzabc|3|'
                }
              ]);
            });
          });
        });
      });
    }
    return dd.context('With ddry hooks', function() {
      return dd.drive([
        {
          before: function() {
            return this.container = 'abc';
          },
          it: "wraps '1'",
          i: [1],
          e: 'abc|1|',
          after: function() {
            return this.container += 'xyz';
          }
        },
        {
          before: function() {
            return this.container += 'abc';
          },
          after: function() {
            return this.container += 'xyz';
          }
        },
        {
          it: "wraps '1' again",
          i: [2],
          e: 'abc|1|xyzabc|2|'
        },
        {
          it: "wraps '1' again and again",
          i: [3],
          e: 'abc|1|xyzabc|2|xyzabc|3|',
          after: function() {
            return delete this.container;
          }
        }
      ]);
    });
  };

}).call(this);
