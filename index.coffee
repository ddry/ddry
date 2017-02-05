'use strict'

matchers = require './lib/matchers'
codeModule = require './lib/code_module'
parsing = require './lib/modular_parsing'

DataDriven = (path) ->
  @.driverFactories = {}
  @.drivers = {}
  @.generators = {}
  @.matchers = matchers
  @.modules = {}
  @.specs = {}
  @.titles = {}
  @.use = false
  @.path = path

DataDriven.prototype.muteOutput = ->
  parsing.muteOutput()

DataDriven.prototype.modular = (params) ->
  parsing.addCustomMatchers @, params
  modules = parsing.parseModular @, params
  for module in modules
    params = [ @ ].concat codeModule.load.apply(codeModule, module)
    parsing.describeModule.apply codeModule, params
  parsing.processModular @

DataDriven.prototype.module = (title, specs) ->
  params = codeModule.load @, title, specs
  parsing.describeModule @, params, specs

DataDriven.prototype.method = (name, specs) ->
  specs = codeModule.setMethod @, name, specs
  parsing.describeMethod @, name, specs

DataDriven.prototype.drive = (spec) ->
  generator = @.generators[@.path]
  generator = generator[@.methodName] unless typeof @.methodName is 'boolean'
  generator.init spec

module.exports = DataDriven
