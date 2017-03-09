'use strict'

object = require '../lib/common/object'

prefixes =
  harness:
    ddry: '..'
    edge: '../edge'
    npmv: 'ddry'
  relative:
    ddry: '../../'
    edge: '../../../'
    npmv: '../../../../'
  root:
    ddry: ''
    edge: 'edge/'
    npmv: 'ddry/'

prefix = (mode) ->
  "#{prefixes.harness[mode]}/"

specContext = (harness, subject) ->
  harness = prefix harness
  helper = prefix subject
  relative = prefixes.relative[subject]
  helper = [ harness, helper, relative ]
  code: "#{prefixes.root[subject]}lib"
  spec: 'spec/lib'
  helper:
    path: 'spec/helper'
    initial: helper
  outside:
    examples: "spec/examples/code"
    index: "#{prefixes.root[subject]}index"
    modular_wrapper: "#{prefixes.root[subject]}modular"
    spec_helper: 'spec/helper'
  initial:
    spec_helper: helper

module.exports = (harness, subject, params) ->
  context = specContext harness, subject
  params = object.merge params, context
  params.cli =
    ddry: "#{prefixes.harness[harness]}/modular"
    prefix: prefixes.relative[harness]
  params
