'use strict'

SpecHelper = (helperPrefix, requirePrefix) ->
  @.prefix = requirePrefix
  @.dataDriven = require "#{helperPrefix}index"
  @.methodContext = require "#{helperPrefix}lib/method_context"
  @.requireSafe = require "#{helperPrefix}lib/require_safe"
  if @.forMocha()
    @.tapeRunner = require "#{helperPrefix}lib/tape_runner"
    tape = require 'tape'
    tape.createStream( objectMode: true ).on 'data', (row) ->
      false

  @.requireSafe
    prefix: @.prefix
  @.examples = {}
  for name in [ 'function_export', 'instance', 'numbering', 'numbering_rewrite', 'properties' ]
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

SpecHelper.prototype.forMocha = ->
  typeof describe is 'function'

SpecHelper.prototype.tapeStub = require 'assert'

SpecHelper.prototype.mergeHashes = (lo, hi) ->
  for key, value of hi
    lo[key] = value
  lo

SpecHelper.prototype.f = -> 1

SpecHelper.prototype.ff = -> 2

module.exports = SpecHelper
