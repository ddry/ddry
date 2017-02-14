'use strict'

TapeSpec = require './tape_spec'
test = require 'tape'

module.exports =
  process: (dd) ->
    tapeList = []
    for module, methodList of dd.specs
      for methodName, methodSpec of methodList
        tapeList.push new TapeSpec module, methodName, methodSpec
    test dd.modularTitle, (t) ->
      console.log "\x1b[32mdd\x1b[34mry\x1b[0m modular spec"
      tapeList.forEach (tapeSpec) ->
        tapeSpec.run dd, t
