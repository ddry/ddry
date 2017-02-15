'use strict'

run = require './run'

module.exports = (harness, subject) ->
  run harness, subject,
    title: 'ddry-by-edge'
    moduleTitles:
      code_module: 'Code module processing core'
      code_module_errors: 'Code module processing error handling'
      code_module_types: 'Code module types processing'
      construct: 'Instance constructor'
      error_report: 'Error reporter'
      matchers: 'Default matchers set'
      matchers_helpers: 'Default matchers helpers'
      method_context: 'Method context constructor'
      modular_helpers: 'Modular spec parsing helpers'
      modular_parsing: 'Modular spec parsing'
      parse_method_name: 'Method name parsing module'
      require_safe: 'Safe require wrapper'
      spec_helper: 'Spec helper spec'
      test_engine: 'Test engine interface'
    only: [
      'code_module'
      'code_module_errors'
      'code_module_types'
      'construct'
      'error_report'
      'matchers'
      'matchers_helpers'
      'method_context'
      'modular_helpers'
      'modular_parsing'
      'parse_method_name'
      'require_safe'
      'spec_helper'
      'test_engine'
    ]
