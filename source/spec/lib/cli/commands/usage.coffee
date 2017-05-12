'use strict'

module.exports = (dd) ->
  dd.drive [
    matcher: 'error'
    it: 'returns brief summary if requested command name is not recognized'
    i: [ '', 'fail' ]
    e: ' ' + dd.helper.requireSafe('lib/cli/usage')['brief']
  ,
    matcher: 'error'
    it: 'returns command usage info'
    i: [ '', 'h' ]
    e: ' ' + dd.helper.requireSafe('lib/cli/usage')['usage']
  ]