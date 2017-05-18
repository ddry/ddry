###
# CoffeeScript range replacement fixing coverage leak
###

'use strict'

module.exports = (from, till) ->
  range = []
  cursor = from
  for i in Array(till - from + 1)
    range.push cursor
    cursor += 1
  range
