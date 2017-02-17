'use strict'

run = require './run'

module.exports = (harness, subject) ->
  run harness, subject,
    title: 'ddry by npm published version'
    moduleTitles:
      code:
        index: 'Code module processing core'
        errors: 'Code module processing error handling'
        types: 'Code module types processing'
      examples:
        function_export: 'Function export example'
        instance: 'Instance example'
        numbering: 'Numbering example sequenced spec'
        properties: 'Module properties and hooks example spec'
      common: 'Commonly used methods'
      error_report: 'Error reporter'
      matchers: 'Default matchers set'
      matchers_helpers: 'Default matchers helpers'
      method_context: 'Method context constructor'
      modular_helpers: 'Modular spec parsing helpers'
      modular_options: 'Modular spec options parsing'
      modular_parsing: 'Modular spec parsing'
      parse_method_name: 'Method name parsing module'
      require_safe: 'Safe require wrapper'
      spec_helper: 'Spec helper spec'
      test_engine: 'Test engine interface'
    only: [
      'code.index'
      'code.errors'
      'code.types'
      'common'
      'error_report'
      'examples.function_export'
      'examples.instance'
      'examples.numbering'
      'examples.properties'
      'matchers_helpers'
      'method_context'
      'modular_helpers'
      'modular_options'
      'modular_parsing'
      'parse_method_name'
      'require_safe'
      'spec_helper'
      'test_engine'
    ]
