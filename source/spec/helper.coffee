'use strict'

SpecHelper = (helperPrefix, requirePrefix) ->
  @.prefix = requirePrefix
  @.dataDriven = require "#{helperPrefix}index"
  @.methodContext = require "#{helperPrefix}lib/method_context"
  @.requireSafeProxy = require "#{helperPrefix}lib/require_safe"
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
    prefix: @.prefix
  ddry.muteOutput()
  ddry

SpecHelper.prototype.f = -> 1

SpecHelper.prototype.requireSafe = (params) ->
  @.requireSafeProxy
    prefix: @.prefix
  @.requireSafeProxy params

module.exports = SpecHelper
