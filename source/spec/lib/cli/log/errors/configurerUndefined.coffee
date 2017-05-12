'use strict'

module.exports = (dd) ->
  dd.drive
    it: 'returns `configurerUndefined` error message'
    i: []
    e: "In order to omit configurer path please specify it at least once."
