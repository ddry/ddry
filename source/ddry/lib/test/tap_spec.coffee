'use strict'

TapSpec = (module, method) ->
  @.module = module
  @.method = method

TapSpec.prototype.formatSpec = (dd, module, method, title) ->
  if typeof dd.modules[module] is 'function'
    format =
      generator: dd.generators[module]
      methodName: false
      specName: method
      title: "#{title} in '#{method}'"
    return format
  format =
    generator: dd.generators[module][method]
    methodName: method
    title: "#{title}: #{@.method}()"

TapSpec.prototype.run = (dd, t) ->
  module = @.module
  method = @.method
  title = dd.titles[module]
  params = @.formatSpec dd, module, method, title
  t.test params.title, (t) ->
    dd.path = module
    dd.methodName = params.methodName
    dd.specName = params.specName
    dd.that = dd.modules[module]
    params.generator.tapeContext = t
    dd.specs[module][method] dd, dd.that
    t.end()

module.exports = TapSpec
