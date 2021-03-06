###
# Spec helper and test data snippets provider
###

'use strict'

SpecHelper = (harness, subject, relative) ->
  @.prefix = relative
  @.dataDriven = require "#{subject}index"
  @.clone = require "#{subject}lib/common/clone"
  @.forMocha = require("#{subject}lib/common/harness").forMocha
  @.methodContext = require "#{subject}lib/spec/context"
  @.requireSafe = require "#{subject}lib/fs/require_safe"
  @.setPrefix = require("#{subject}lib/cli/kernel").setPrefix
  @.switch = require("#{subject}lib/cli/configurer").switch
  object = require "#{subject}lib/common/object"
  object.extend @, object
  @.c = require "#{subject}lib/common/colors"
  @.io = require "#{subject}lib/cli/io"

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

SpecHelper.prototype.ddry = ->
  DataDriven = @.dataDriven
  ddry = new DataDriven()
  ddry.module
    prefix: @.prefix
  ddry.muteOutput()
  ddry

SpecHelper.prototype.tapStub = require 'assert'

SpecHelper.prototype.tapStub.skip = -> 1

SpecHelper.prototype.f = -> 1

SpecHelper.prototype.ff = -> 2

SpecHelper.prototype.message = (i, e) ->
  "returns #{e} for #{i}"

SpecHelper.prototype.oops = -> throw new Error 'oops!'

SpecHelper.prototype.setCli = (dev, npmRoot) ->
  if typeof dev is 'string'
    return 'cli.js'
  npmRoot = npmRoot or 'node_modules'
  "#{npmRoot}/ddry/cli.js"

module.exports = SpecHelper
