'use strict'

SpecData = (mochaMethod, matcher, input, expected, message, before, after) ->
  @.mochaMethod = mochaMethod
  @.matcher = matcher
  @.before = before if before
  @.after = after if after
  @.input = input
  @.expected = expected
  @.message = message

module.exports = SpecData
