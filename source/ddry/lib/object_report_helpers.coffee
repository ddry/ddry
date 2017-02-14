'use strict'

module.exports =
  create: (object, baseKey = [], report = []) ->
    for key, value of object
      if @.validObject value
        baseKey.push key
        report = @.create value, baseKey, report
      else
        finalValue = {}
        finalKey = baseKey.slice 0
        finalKey.push key
        finalValue[ finalKey.join '.' ] = @.format value
        report.push finalValue
    report

  format: (value) ->
    if typeof value is 'function'
      definition = "#{value}".replace(/ /g, '')
      return definition.replace(/__cov_[^\+]*\+\+;/g, '')
    "#{value}"

  validObject: (value) ->
    return false unless value and typeof value is 'object'
    if Array.isArray value
      return false unless @.containsObjects value
    return false unless Object.keys(value).length
    true

  containsObjects: (value) ->
    for element in value
      return true if element and typeof element is 'object'
    false