'use strict'

module.exports = (dd) ->
  config =
    code: 'lib'
  dd.drive [
    before: ->
      dd.config = dd.helper.io.load()
    it: 'fires command execution and saves config file if necessary'
    i: [ 'remove', [ config, 'code', 'value' ] ]
    e: true
    after: ->
      dd.helper.io.save dd.config
  ,
    matcher: 'error'
    it: 'terminates test harness launch for usage info'
    i: [ 'usage' ]
    e: ' ' + dd.helper.requireSafe('lib/cli/usage')['brief']
  ]
