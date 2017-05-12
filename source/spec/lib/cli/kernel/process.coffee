'use strict'

module.exports = (dd) ->
  dd.drive [
    matcher: 'error'
    it: 'processes given command with given parameters'
    i: [ 'usage', [] ]
    e: ' ' + dd.helper.requireSafe('lib/cli/usage')['brief']
  ]
