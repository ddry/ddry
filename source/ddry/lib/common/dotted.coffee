###
# Dotted name parser
###

'use strict'

module.exports = 
  fits: (node, any) ->
    return typeof node isnt 'undefined' if any
    typeof node is 'function'

  parse: (that, name, any = true) ->
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
    return cursor[methodName] if @.fits cursor[methodName], any
    [ xPath, methodName ]
