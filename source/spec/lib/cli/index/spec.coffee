'use strict'

module.exports = (dd) ->
  dd.drive [
    before: ->
      process.env.DDRY_CLI = 'cli.js'
    it: 'runs unscoped suite if no params given'
    i: [ [] ]
    e: true
  ,
    it: 'runs command if recognizes'
    i: [ 'remove', 'moduleTitles', 'value' ]
    e: true
  ,
    before: ->
      dd.ddryCli = dd.helper.io.load true
    it: 'runs CLI scope if given'
    i: [ '-o', 'lib/' ]
    e: true
    after: ->
      dd.helper.io.save dd.ddryCli, true
  ,
    matcher: 'error'
    it: 'block stderr output and delegates it to own logger'
    i: [ 'e' ]
    e: ''
    after: ->
      delete process.env.DDRY_CLI
  ]
