###
# Unordered array elements set checker
###

'use strict'

module.exports =
  clean:
    extra: []
    missing: []

  compare: (i, e) ->
    result =
      extra: []
      missing: []
    for element in i
      result.missing.push element if e.indexOf(element) is -1
    for element in e
      result.extra.push element if i.indexOf(element) is -1
    result
