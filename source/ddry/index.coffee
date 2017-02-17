'use strict'

common = require './lib/common'
matchers = require './lib/matchers'
codeModule = require './lib/code'
parsing = require './lib/modular_parsing'

DataDriven = (path) ->
  @.driverFactories = {}
  @.drivers = {}
  @.generators = {}
  @.harness = common.harness()
  @.matchers = matchers
  @.modules = {}
  @.specs = {}
  @.titles = {}
  @.use = false
  @.path = path

DataDriven.prototype.muteOutput = ->
  parsing.muteOutput()

DataDriven.prototype.modular = (params) ->
  @.modularTitle = params.title or 'Modular spec'
  parsing.addCustomMatchers @, params
  parsing.attachHelper @, params
  modules = parsing.parseModular @, params
  that = @
  parsing.setContext @.harness, 'modular', @.modularTitle, ->
  for module in modules
    params = [ that ].concat codeModule.load.apply(codeModule, module)
    parsing.describeModule.apply codeModule, params
  parsing.processModular @

DataDriven.prototype.module = (title, specs) ->
  params = codeModule.load @, title, specs
  parsing.describeModule @, params, specs

DataDriven.prototype.method = (name, specs) ->
  specs = codeModule.setMethod @, name, specs
  parsing.describeMethod @, name, specs

DataDriven.prototype.context = (title, specs) ->
  parsing.setContext @.harness, 'context', title, specs

DataDriven.prototype.drive = (spec) ->
  generator = @.generators[@.path]
  generator = generator[@.methodName] unless typeof @.methodName is 'boolean'
  generator.init spec

module.exports = DataDriven
