'use strict'

run = require './run'

module.exports = (harness, subject) ->
  run harness, subject,
    moduleTitles:
      code_module: 'Code module processing core'
      code_module_errors: 'Code module processing error handling'
      code_module_types: 'Code module types processing'
      construct: 'Instance constructor'
      error_report: 'Error reporter'
      require_safe: 'Safe require wrapper'
      spec_helper: 'Spec helper spec'
    only: [
      'code_module'
      'code_module_errors'
      'code_module_types'
      'construct'
      'error_report'
      'require_safe'
      'spec_helper'
    ]