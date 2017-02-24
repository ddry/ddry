'use strict'

report = require './report'

module.exports = 
  report: report.create
  format: report.format
  extend: report.extend

  construct: (constructor, args) ->
    F = ->
      constructor.apply(this, args);
    F.prototype = constructor.prototype;
    new F()

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
    @.insertValue lo, cursor, target, value

  insertValue: (lo, cursor, target, value) ->
    node = cursor[target]
    if Array.isArray node
      value = @.toArray value
      cursor[target] = node.concat value
      return lo
    if node and typeof node is 'object'
      node = @.extend node, value
      return lo
    cursor[target] = value
    lo

  merge: (lo, hi) ->
    hiReport = report.create hi, true
    for key, value of hiReport
      lo = @.insertKey lo, key, value
    lo

  toArray: (value, types) ->
    return [] unless value
    return value if Array.isArray value
    return [ value ] unless types
    types = @.toArray types
    return [ value ] if types.indexOf(typeof value) isnt -1
    value
