'use strict'

SpecHelper = (harness, subject, relative) ->
  @.prefix = relative
  @.dataDriven = require "#{subject}index"
  @.methodContext = require "#{subject}lib/method_context"
  @.requireSafe = require "#{subject}lib/require_safe"
  common = require "#{subject}lib/common"
  common.mergeHashes @, common
  if @.forMocha()
    @.tapeRunner = require "#{subject}lib/tape_runner"
    tape = require 'tape'
    tape.createStream( objectMode: true ).on 'data', (row) ->
      false
    tape.test 'cover', (t) ->
      t.deepEqual 1, 1
      t.end()

  @.requireSafe
    prefix: @.prefix
  @.examples = {}
  for name in [ 'function_export', 'instance', 'numbering', 'properties' ]
    @.examples[name] = @.requireSafe "spec/examples/code/lib/#{name}"
  @.ddry()
  true

SpecHelper.prototype.ddry = (path = '') ->
  DataDriven = @.dataDriven
  ddry = new DataDriven path
  ddry.module
    prefix: @.prefix
  ddry.muteOutput()
  ddry

SpecHelper.prototype.tapeStub = require 'assert'

SpecHelper.prototype.f = -> 1

SpecHelper.prototype.ff = -> 2

module.exports = SpecHelper
