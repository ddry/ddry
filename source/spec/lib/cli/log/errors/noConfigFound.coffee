'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns `noConfigFound` error message'
    i: []
    e: "No spec config file (#{dd.helper.c.bright 'ddry.json'}) found. Run 'ddry init' to create it first."
  ]
