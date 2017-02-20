'use strict'

module.exports = 
  construct: (constructor, args) ->
    F = ->
      constructor.apply(this, args);
    F.prototype = constructor.prototype;
    new F()

  containsObjects: (value) ->
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

  format: (value) ->
    if typeof value is 'function'
      definition = "#{value}".replace(/ /g, '')
      return definition.replace(/__cov_[^\+]*\+\+;/g, '')
    return value if Array.isArray value
    "#{value}"

  forMocha: ->
    typeof describe is 'function'

  insertKey: (lo, key, value) ->
    xPath = key.split '.'
    target = xPath.pop()
    cursor = lo
    if xPath.length
      for i in [0..xPath.length - 1]
        node = xPath[i]
        arrayFollows = /^\d+$/.test xPath[ i + 1 ]
        nextNode = if arrayFollows then [] else {}
        cursor[node] = cursor[node] or nextNode
        cursor = cursor[node]
    cursor[target] = value
    lo

  mergeHashes: (lo, hi) ->
    for key, value of hi
      lo[key] = value
    lo

  mergeObjects: (lo, hi) ->
    report = @.report hi, true
    for key, value of report
      lo = @.insertKey lo, key, value
    lo

  report: (value, hash = false) ->
    return @.format value unless @.validObject value
    report = @.create value, null, null, hash
    return report unless hash
    reportHash = {}
    for key in report
      reportHash = @.mergeHashes reportHash, key
    reportHash

  reportValue: (value, key, raw) ->
    return "#{key}: #{@.format value}" unless raw
    _ =
      "#{key}": value

  validObject: (value) ->
    return false unless value and typeof value is 'object'
    if Array.isArray value
      return false unless @.containsObjects value
    return false unless Object.keys(value).length
    true
