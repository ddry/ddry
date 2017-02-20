'use strict'

module.exports = (mocha, tape)->
  mocha ?= typeof describe is 'function'
  tape ?= /tape/.test process.argv[1]
  return 'mocha' if mocha
  return 'tape' if tape
  'tap'
