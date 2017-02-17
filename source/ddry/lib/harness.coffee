'use strict'

module.exports = ->
  return 'mocha' if typeof describe is 'function'
  return 'tape' if /tape/.test process.argv[1]
  'tap'
