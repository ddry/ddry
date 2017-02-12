// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = function(dd, that) {
    context("With few set to 2", function() {
      before(function() {
        return that.few = 2;
      });
      return dd.drive([
        {
          it: "Says 'hihi' once",
          i: [],
          e: 'hihi'
        }, {
          it: "Says 'blahblah' once",
          i: ['blah'],
          e: 'blahblah'
        }
      ]);
    });
    context("With few set to 3", function() {
      before(function() {
        return that.few = 3;
      });
      return dd.drive([
        {
          it: "Says 'hihihi' once",
          i: [],
          e: 'hihihi'
        }, {
          it: "Says 'blahblahblah' once",
          i: ['blah'],
          e: 'blahblahblah'
        }
      ]);
    });
    return context("With few set again to 2", function() {
      before(function() {
        return that.few = 2;
      });
      return dd.drive([
        {
          it: "Says 'hihi' once",
          i: [],
          e: 'hihi'
        }, {
          it: "Says 'blahblah' once",
          i: ['blah'],
          e: 'blahblah'
        }
      ]);
    });
  };

}).call(this);