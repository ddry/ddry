'use strict'

module.exports = (dd) ->
  dd.drive
    it: "returns 'modulePropertiesError' message for given params"
    i: [ 'title', 'name', [ 'x', 'x', 'path' ], 'key' ]
    e:
      title: "Could not reach method 'name' in 'title'"
      messages: [ "Trod to 'x.x.path', no 'key' there." ]
