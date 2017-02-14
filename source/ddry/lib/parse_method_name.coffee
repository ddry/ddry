'use strict'

module.exports = (that, name) ->
  return that if typeof that is 'function'
  return false unless that and typeof that is 'object'
  xPath = name.split '.'
  return that[name] if xPath.length is 1
  methodName = xPath.pop()
  troddenPath = []
  cursor = that
  for key in xPath
    if typeof cursor[key] is 'object'
      cursor = cursor[key]
      troddenPath.push key
    else
      return [ troddenPath, key ]
  return cursor[methodName] if typeof cursor[methodName] is 'function'
  [ xPath, methodName ]
