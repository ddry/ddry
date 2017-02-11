// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = {
    ordinal: function(n) {
      var index;
      index = ~~(n / 10 % 10) - 1 ? n % 10 : 0;
      return n + ([false, 'st', 'nd', 'rd'][index] || 'th');
    },
    query: function(limit) {
      var i, results;
      return (function() {
        results = [];
        for (var i = 1; 1 <= limit ? i <= limit : i >= limit; 1 <= limit ? i++ : i--){ results.push(i); }
        return results;
      }).apply(this).map(function(number) {
        return "key" + number + "=value" + number;
      }).join('&');
    },
    selector: function(limit, tag) {
      if (limit == null) {
        limit = 1;
      }
      if (tag == null) {
        tag = 'li';
      }
      return tag + Array(limit).join("+" + tag);
    }
  };

}).call(this);
