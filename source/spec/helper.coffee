'use strict'

SpecHelper = (prefix) ->
  @.dataDriven = require "#{prefix}index"
  @.methodContext = require "#{prefix}lib/method_context"
  @.requireSafeProxy = require "#{prefix}lib/require_safe"
  @.ddry()
  true

SpecHelper.prototype.mergeHashes = (lo, hi) ->
  for key, value of hi
    lo[key] = value
  lo

SpecHelper.prototype.ddry = (path = '') ->
  DataDriven = @.dataDriven
  ddry = new DataDriven path
  ddry.module
    prefix: '../'
  ddry.muteOutput()
  ddry

SpecHelper.prototype.f = -> 1

SpecHelper.prototype.requireSafe = (params) ->
  @.requireSafeProxy
    prefix: '../'
  @.requireSafeProxy params

module.exports = SpecHelper
