'use strict'

module.exports = (dd) ->
  Clone = dd.helper.requireSafe 'lib/common/clone'
  clone = new Clone one: 1

  dd.drive [
    matcher: 'plain'
  ,
    it: 'clones the initial object'
    i: clone
    e:
      one: 1
  ,
    it: 'is instance of Object cloning facility'
    i: clone instanceof Clone
    e: true
  ]
