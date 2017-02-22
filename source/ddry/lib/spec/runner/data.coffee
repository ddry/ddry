'use strict'

detect = require './detect'
sequenceSyntax = require '../syntax'

module.exports =
  process: (spec, specParams) ->
    _ = if detect.sequence spec, specParams
    then @.generateSequence spec, specParams
    else @.generateSingle spec, specParams

  generateSingle: (spec, specParams) ->
    [ sequenceSyntax.setSpecData specParams, spec.i, spec.e, spec[specParams.mochaMethod] ]

  generateSequence: (specSequence, specParams) ->
    sequence = []
    from = specSequence.from ? 1
    specSequence.from = from
    till = from + specSequence.data.length - 1
    for specIndex in [from..till]
      sequence.push sequenceSyntax.parse specSequence, specIndex, specParams
    sequence
