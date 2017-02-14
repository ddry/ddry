'use strict'

SpecHelper = (helperPrefix, requirePrefix) ->
  @.prefix = requirePrefix

  @.dataDriven = require "#{helperPrefix}index"
  @.methodContext = require "#{helperPrefix}lib/method_context"
  @.requireSafeProxy = require "#{helperPrefix}lib/require_safe"

  @.initTapeContext()
  @.ddry()
  true

SpecHelper.prototype.ddry = (path = '') ->
  DataDriven = @.dataDriven
  ddry = new DataDriven path
  ddry.module
    prefix: @.prefix
  ddry.muteOutput()
  ddry

SpecHelper.prototype.requireSafe = (params) ->
  @.requireSafeProxy
    prefix: @.prefix
  @.requireSafeProxy params

SpecHelper.prototype.tape = require 'tape'

SpecHelper.prototype.initTapeContext = ->
  # if typeof describe is 'function'
  #   tape.createStream( objectMode: true ).on 'data', (row) ->
  #     false
  true

SpecHelper.prototype.mergeHashes = (lo, hi) ->
  for key, value of hi
    lo[key] = value
  lo
SpecHelper.prototype.f = -> 1

SpecHelper.prototype.ff = -> 2

module.exports = SpecHelper
