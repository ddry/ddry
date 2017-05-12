'use strict'

module.exports = (dd) ->
  dd.drive [
    before: ->
      dd.config = dd.helper.io.load()
    it: 'saves config object'
    i: [ {} ]
    e: "#{dd.helper.c.ddry()} spec configuration saved in #{dd.helper.c.bright 'ddry.json'}"
    after: ->
      dd.helper.io.save dd.config
  ]
