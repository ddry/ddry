###
# Harness detector
###

'use strict'

module.exports =
  forMocha: ->
    typeof describe is 'function'

  detect: (mocha, tape) ->
    mocha ?= @.forMocha()
    tape ?= /tape/.test process.argv[1]
    return 'mocha' if mocha
    return 'tape' if tape
    'tap'
