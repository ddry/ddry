'use strict'

module.exports = (dd) ->
  dd.drive [
    matcher: 'property'
    it: 'Sets instance property'
    i: [ 'prop01',
      folder:
        first:
          one: 1
          two: -> 2 ]
    e:
      "prop01.folder.first.one": 1
      "prop01.folder.first.two": -> 2
    ]
