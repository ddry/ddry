'use strict'

module.exports = (dd) ->
  dd.drive
    it: 'reads a file with a given name'
    i: [ 'spec/examples/empty_object' ]
    e: """
// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = {};

}).call(this);

      """