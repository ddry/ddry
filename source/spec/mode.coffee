'use strict'

module.exports =
  prefixes:
    harness:
      ddry: '..'
      edge: '../edge'
      npmv: 'ddry'
    relative:
      ddry: '../'
      edge: '../../'
      npmv: '../../../'
    root:
      ddry: ''
      edge: 'edge/'
      npmv: 'ddry/'

  run: (harness, subject, params) ->
    spec = require "#{@.prefixes.harness[harness]}/modular"
    spec = spec params
    spec.setPrefix @.prefixes.relative[harness]
    spec.apply @.context(harness, subject)

  context: (harness, subject) ->
    helperPrefix = "#{@.prefixes.harness[subject]}/"
    relative = "#{@.prefixes.relative[subject]}"
    helper = [ helperPrefix, relative ]
    title: 'DDRY modular spec'
    code: "#{@.prefixes.root[subject]}lib"
    spec: 'spec/lib'
    helper:
      path: 'spec/helper'
      initial: helper
    outside:
      index: "#{@.prefixes.root[subject]}index"
      modular: "#{@.prefixes.root[subject]}modular"
      spec_helper: 'spec/helper'
    initial:
      spec_helper: helper
