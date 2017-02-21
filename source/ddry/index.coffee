'use strict'

harness = require './lib/common/harness'
matchers = require './lib/matchers'
codeModule = require './lib/code'
modular = require './lib/modular'

DataDriven = (path) ->
  @.constructors = {}
  @.driverFactories = {}
  @.drivers = {}
  @.generators = {}
  @.harness = harness()
  @.instances = {}
  @.matchers = matchers
  @.modules = {}
  @.specs = {}
  @.titles = {}
  @.use = false
  @.path = path

DataDriven.prototype.muteOutput = ->
  modular.muteOutput()

DataDriven.prototype.modular = (params) ->
  @.modularTitle = params.title or 'Modular spec'
  modular.addCustomMatchers @, params
  modular.attachHelper @, params
  modules = modular.parseModular @, params
  that = @
  modular.setContext @.harness, 'modular', @.modularTitle, ->
  for module in modules
    params = [ that ].concat codeModule.load.apply(codeModule, module)
    modular.describeModule.apply codeModule, params
  modular.processModular @

DataDriven.prototype.module = (title, specs) ->
  params = codeModule.load @, title, specs
  modular.describeModule @, params, specs

DataDriven.prototype.method = (name, specs) ->
  specs = codeModule.setMethod @, name, specs
  modular.describeMethod @, name, specs

DataDriven.prototype.context = (title, specs) ->
  modular.setContext @.harness, 'context', title, specs

DataDriven.prototype.drive = (spec) ->
  generator = @.generators[@.path]
  generator = generator[@.methodName] unless typeof @.methodName is 'boolean'
  generator.init spec

module.exports = DataDriven
