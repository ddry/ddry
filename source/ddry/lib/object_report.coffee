'use strict'

buildReport = (object, baseKey = [], report = []) ->
  for key, value of object
    if typeof value is 'object'
      baseKey.push key
      report = buildReport value, baseKey, report
    else
      finalValue = {}
      finalKey = baseKey.slice 0
      finalKey.push key
      finalValue[ finalKey.join '.' ] = "#{value}".replace(/ /g, '')
      report.push finalValue
  report

module.exports = (object) ->
  buildReport object
