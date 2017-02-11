'use strict'

module.exports = (object) ->
  create: (object, baseKey = [], report = []) ->
  for key, value of object
    if typeof value is 'object'
      baseKey.push key
      report = buildReport value, baseKey, report
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
