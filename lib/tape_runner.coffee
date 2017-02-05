'use strict'

TapeSpec = require './tape_spec'
test = require 'tape'

module.exports =
  process: (dd) ->
    tapeList = []
    for module, methodList of dd.specs
      for methodName, methodSpec of methodList
        tapeList.push new TapeSpec module, methodName, methodSpec
    test 'Modular spec', (t) ->
      tapeList.forEach (tapeSpec) ->
        tapeSpec.run dd, t
