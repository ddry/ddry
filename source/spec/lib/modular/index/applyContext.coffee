'use strict'

module.exports = (dd) ->
  ddry =
    that: true

  dd.drive
    it: 'applies data to spec then to function passed to the context'
    i: [ ddry, dd.helper.same, [ 1 ] ]
    e: 1