// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = {
    ordinal: function(n) {
      return n + "th";
    },
    selector: function(limit, tag) {
      if (limit == null) {
        limit = 10;
      }
      if (tag == null) {
        tag = 'div';
      }
      return tag + Array(limit).join("+" + tag);
    }
  };

}).call(this);
