'use strict'

module.exports = (n = 1, string = 'hi') ->
  Array(n + 1).join string
