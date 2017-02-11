'use strict'

module.exports =
  ordinal: (n) ->
    index = if ~~(n/10%10)-1 then n%10 else 0
    n + ([false, 'st', 'nd', 'rd'][index]||'th')
  query: (limit) ->
    [1..limit].map (number) ->
      "key#{number}=value#{number}"
    .join '&'
  selector: (limit = 1, tag = 'li') ->
    tag + Array(limit).join("+#{tag}")
