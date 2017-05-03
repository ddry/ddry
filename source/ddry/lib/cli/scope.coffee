'use strict'

object = require '../common/object'

module.exports =
  codeModule: ->
    codeModule = @.item.replace /\.js$/, ''
    for name, path of @.modulePaths
      return name if codeModule is path
    false

  detect: (item, config, modulePaths, methodPaths, specPath) ->
    @.item = item
    @.config = config
    @.modulePaths = modulePaths
    @.methodPaths = methodPaths
    @.specPath = specPath
    method = @.method()
    return method if method
    codeModule = @.codeModule()
    return codeModule if codeModule
    folder = @.folder()
    return folder if folder
    false

  folder: ->
    if @.specPath.test @.item
      folder = @.item.replace @.specPath, ''
      return folder.replace /\/$/, ''
    outside = new RegExp "^#{@.item}"
    for name, path of @.modulePaths
      if outside.test path
        folder = path.replace outside, ''
        folder = folder.split('/').join '.'
        folder = name.replace ".#{folder}", ''
        return folder
    false

  key: (mode, detect) ->
    if Array.isArray detect
      key =
        key: "methods.#{detect[0]}.#{mode}"
        value: [ detect[1] ]
      return key
    _ =
      key: mode
      value: [ detect ]

  method: ->
    return false unless @.specPath.test @.item
    method = @.item.replace @.specPath, ''
    method = method.replace /\.js$/, ''
    method = method.split('/').join '.'
    method = method.replace /\.$/, ''
    codeModule = object.match method, @.methodPaths, true, true
    return false unless codeModule
    return codeModule unless method.replace("#{codeModule}", '').length
    method = method.replace "#{codeModule}.", ''
    [ codeModule, method ]
