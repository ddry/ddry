'use strict'

parseMethodName = require './parse_method_name'

module.exports =
  order: [ 'noModuleContext', 'modulePropertiesError', 'methodNotDefined' ]
  detectors:
    noModuleContext: (title, that, name, use) ->
      return false if use
      objectLike = that and typeof that is 'object'
      functionLike = typeof that is 'function'
      return [ name ] unless objectLike or functionLike
      false
    modulePropertiesError: (title, that, name, use) ->
      return false if use
      method = parseMethodName that, name
      return [ title, name, method[0], method[1] ] if Array.isArray method
      false
    methodNotDefined: (title, that, name, use) ->
      return false if use
      return false if typeof that is 'function'
      method = parseMethodName that, name
      return [ title, name ] unless typeof method is 'function'
      false
  messages:
    noModuleContext: (name) ->
      title: 'No module context set.'
      messages: [ "Nowhere to place method '#{name}'." ]
    modulePropertiesError: (title, name, xpath, key) ->
      title: "Could not reach method '#{name}' in '#{title}'"
      messages: [ "Trod to '#{xpath.join '.'}', no '#{key}' there." ]
    methodNotDefined: (title, name) ->
      title: "Method #{name}()"
      messages: [ "is not defined in '#{title}'"]
