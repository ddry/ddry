###
# Object report methods
###

'use strict'

Clone = require '../../clone'

module.exports =
  containsObjects: (value) ->
    return false unless Array.isArray value
    for element in value
      return true if element and typeof element is 'object'
      return true if typeof element is 'function'
    false

  create: (object, baseKey = [], report = [], raw = false) ->
    for key, value of object
      if @.validObject value
        report = @.create value, baseKey.concat([key]), report, raw
      else
        report.push @.reportValue(value, baseKey.concat([key]).join('.'), raw)
    report

  extend: (lo, hi, clone = false) ->
    for key, value of hi
      lo[key] = value
    return lo unless clone
    new Clone lo

  format: (value) ->
    if typeof value is 'function'
      definition = "#{value}".replace(/ /g, '')
      return definition.replace(/[_]*cov_[^\+]*\+\+;/g, '')
    return value if Array.isArray value
    String value

  isObject: (value) ->
    value and typeof value is 'object'

  reportValue: (value, key, raw) ->
    return "#{key}: #{@.format value}" unless raw
    _ =
      "#{key}": value

  validObject: (value) ->
    return false unless @.isObject value
    if Array.isArray value
      return false unless @.containsObjects value
    return false unless Object.keys(value).length
    true
