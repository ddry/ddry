'use strict'

object = require '../../lib/common/object'

prefixes =
  cli:
    ddry: '../../../..'
    edge: '../../../../edge'
    npmv: "ddry"
  devCli:
    ddry: '../..'
    edge: '../../edge'
    npmv: "ddry"
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
    npmv: "ddry/"
  outsideRoot:
    ddry: ''
    edge: 'edge/'
    npmv: "#{process.env.NPM_ROOT}/ddry/"

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
    index: "#{prefixes.outsideRoot[subject]}index"
    modular_wrapper: "#{prefixes.outsideRoot[subject]}modular"
    spec_helper: 'spec/helper'
  initial:
    spec_helper: helper

module.exports = (harness, subject, params) ->
  context = specContext harness, subject
  params = object.merge params, context
  cliKey = if typeof process.env.DDRY_DEV is 'undefined' then 'cli' else 'devCli'
  params.cli =
    ddry: "#{prefixes[cliKey][harness]}/modular"
    prefix: prefixes.relative[harness]
  params
