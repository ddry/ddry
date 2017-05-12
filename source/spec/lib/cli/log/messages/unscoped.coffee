'use strict'

module.exports = (dd) ->
  dd.drive
    it: 'returns `unscoped` message'
    i: []
    e: "Running spec with unscoped #{dd.helper.c.bright 'ddry.json'}"
