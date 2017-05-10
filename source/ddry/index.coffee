###
# ddry core
###

'use strict'

codeModule = require './lib/code'
harness = require './lib/common/harness'
extend = require('./lib/common/object').extend
matchers = require './lib/matchers'
modular = require './lib/modular'

DataDriven = (path) ->
  @.constructors = {}
  @.driverFactories = {}
  @.drivers = {}
  @.generators = {}
  @.harness = harness.detect()
  @.instancesList = {}
  @.instanceNames = {}
  @.matchers = extend {}, matchers
  @.modules = {}
  @.specs = {}
  @.specNames = {}
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
  modular.setContext @.harness, 'modular', @.modularTitle
  for module in modules
    params = [ that ].concat codeModule.load.apply(codeModule, module)
    modular.describeModule.apply codeModule, params
  modular.processModular @

DataDriven.prototype.module = (title, specs) ->
  params = codeModule.load @, title, specs
  modular.describeModule @, params, specs

DataDriven.prototype.instances = ->
  instances = @.instancesList[@.path]
  return {} unless instances and typeof instances is 'object'
  @.instancesList[@.path]

DataDriven.prototype.method = (name, specs) ->
  specs = codeModule.setMethod @, name, specs
  modular.describeMethod @, name, specs

DataDriven.prototype.ry = (context, data, spec) ->
  if context and typeof context is 'object'
    that = @
    for _, spec of context
      that.ry spec.context, [ spec ], (spec) ->
        that.drive
          it: spec.it
          i: spec.i
          e: spec.e
    return true
  if context
    that = @
    that.context context, modular.applyContext that, spec, data
    return true
  spec.apply @.that, data
  true

DataDriven.prototype.context = (title, specs) ->
  modular.setContext @.harness, 'context', title, specs

DataDriven.prototype.drive = (spec) ->
  generator = @.generators[@.path]
  generator = generator[@.methodName] unless typeof @.methodName is 'boolean'
  generator.init spec
  true

DataDriven.prototype.pending = ->
  name = @.methodName or @.specName
  matcher: 'plain'
  xit: "pending: #{@.titles[@.path]}: #{name}()"
  i: 1
  e: 1

module.exports = DataDriven
