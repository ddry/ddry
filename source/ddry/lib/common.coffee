'use strict'

module.exports = 
  construct: (constructor, args) ->
    F = ->
      constructor.apply(this, args);
    F.prototype = constructor.prototype;
    new F()

  forMocha: ->
    typeof describe is 'function'

  harness: ->
    return 'mocha' if @.forMocha()
    return 'tape' if /tape/.test process.argv[1]
    'tap'

  mergeHashes: (lo, hi) ->
    for key, value of hi
      lo[key] = value
    lo
