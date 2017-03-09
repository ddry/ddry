###
# Object cloning facility
###

'use strict'

Clone = (original) ->
  for key, value of original
    @[key] = value
  true

module.exports = Clone
