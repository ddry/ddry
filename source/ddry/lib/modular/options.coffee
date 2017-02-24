'use strict'

object = require '../common/object'

module.exports = 
  collect: (params, moduleName, moduleParams, options) ->
    @.params = params
    @.moduleName = moduleName
    @.moduleParams = moduleParams
    for option in options
      @.parse option
    @.moduleParams

  get: (option) ->
    xPath = @.moduleName.split '.'
    xPath.unshift option
    cursor = @.params
    for node in xPath
      return false if typeof cursor[node] is 'undefined'
      cursor = cursor[node]
    cursor

  getModuleParams: (codeModules, moduleName, params) ->
    @.collect params, moduleName,
      path: codeModules[moduleName]
      , [ 'title:moduleTitles'
          'methods'
          'initial'
          [ 'use' ] ]

  getSet: (option) ->
    optionValue = object.toArray @.params[option], 'string'
    return false unless Array.isArray optionValue
    optionValue.indexOf(@.moduleName) isnt -1

  parse: (option) ->
    return @.parseSet option if Array.isArray option
    @.parseSingle option

  parseRequired: (option, required) ->
    return option if option
    return @.moduleName if required
    option

  parseSet: (options) ->
    for option in options
      @.moduleParams[option] = @.getSet option
    true

  parseSingle: (option) ->
    option = option.split ':'
    [ paramsKey, ... , optionName ] = option
    paramsOption = @.get optionName
    required = option.length > 1
    paramsOption = @.parseRequired paramsOption, required
    @.moduleParams[paramsKey] = paramsOption if paramsOption
