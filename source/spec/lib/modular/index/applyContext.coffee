'use strict'

module.exports = (dd) ->
  ddry =
    that: true
  spec = (n) ->
    n
  applied = dd.that.applyContext ddry, spec, [ 1 ]

  dd.drive
    matcher: 'plain'
    it: 'applies data to spec then to function passed to the context'
    i: applied()
    e: 1
