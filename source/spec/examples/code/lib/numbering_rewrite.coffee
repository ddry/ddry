'use strict'

module.exports =
  ordinal: (n) -> "#{n}th"
  selector: (limit = 10, tag = 'div') ->
    tag + Array(limit).join("+#{tag}")
