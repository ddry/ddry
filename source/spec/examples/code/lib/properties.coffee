'use strict'

module.exports =
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