'use strict'

parseMethodName = require './parse_method_name'

module.exports = (code, name) ->
  method = parseMethodName code, name
  return method if typeof method is 'function'
  instanceMethod = name.split '.'
  instanceMethod.shift()
  instanceMethod = parseMethodName code, instanceMethod.join('.')
  return instanceMethod if typeof instanceMethod is 'function'
  method
