'use strict'

module.exports =
  mapHash: (hash, methodName, argArray = []) ->
    mappedHash = {}
    for key, value of hash
      argArray.unshift value
      mappedHash[key] = @[methodName].apply @, argArray
    mappedHash

  repeatFewTimes: (n, string = 'hi') ->
    Array(n * @.few + 1).join string

  wrapIt: (string) ->
    @.container += "|#{string}|"

  deep:
    deep:
      deep:
        inside:
          once: (string) ->
            @.repeatFewTimes 1, string
          
          twice: (string) ->
            @.repeatFewTimes 2, string

          thrice: (string) ->
            @.repeatFewTimes 3, string