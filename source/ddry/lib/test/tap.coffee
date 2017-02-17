'use strict'

TapeSpec = require './tap_spec'

module.exports =
  process: (dd) ->
    @.test = @.initHarness dd.harness
    tapeList = []
    for module, methodList of dd.specs
      for methodName, methodSpec of methodList
        tapeList.push new TapeSpec module, methodName, methodSpec
    that = @
    @.test dd.modularTitle, (t) ->
      unless that.mute dd
        console.log "\x1b[32mdd\x1b[34mry\x1b[0m modular spec"
      tapeList.forEach (tapeSpec) ->
        tapeSpec.run dd, t
      t.end()

  initHarness: (harness) ->
    return require 'tape' if harness is 'tape'
    require('tap').test

  mute: (dd) ->
    dd.harness is 'tap' or /muteTape/.test dd.modularTitle
