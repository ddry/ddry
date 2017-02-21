'use strict'

SpecHelper = (harness, subject, relative) ->
  @.prefix = relative
  @.dataDriven = require "#{subject}index"
  @.methodContext = require "#{subject}lib/spec/context"
  @.requireSafe = require "#{subject}lib/fs/require_safe"
  object = require "#{subject}lib/common/object"
  object.mergeHashes @, object
  if @.forMocha()
    @.tapeRunner = require "#{subject}lib/test/tap"
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
    @.examples[name] = @.requireSafe "spec/examples/code/#{name}"
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
