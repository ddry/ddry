'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns title hash if given'
    i: [
      title: 'title'
      path: 'path'
    ]
    e:
      title: 'title'
      path: 'path'
  ,
    it: 'assembles title hash from given strings'
    i: [ 'title', 'path' ]
    e:
      title: 'title'
      path: 'path'
  ]
