'use strict'

run = require './run'
initial = require './initial'

module.exports = (harness, subject) ->
  run harness, subject,
    title: 'ddry by npm published version'
    moduleTitles:
      code:
        index: 'Code module processing core'
        errors: 'Code module processing error handling'
        types: 'Code module types processing'
      common:
        object: 'Commonly used object methods'
        error_report: 'Error reporter'
        harness: 'Harness detector'
        parse_method_name: 'Method name parsing module'
      examples:
        function_export: 'Function export example'
        instance: 'Instance example'
        numbering: 'Numbering example sequenced spec'
        properties: 'Module properties and hooks example spec'
      fs:
        require_safe: 'Safe require wrapper'
      modular:
        helpers: 'Modular spec parsing helpers'
        options: 'Modular spec options parsing'
        index: 'Modular spec parsing'
      spec:
        context: 'Method context constructor'
      test:
        engine: 'Test engine interface'
      spec_helper: 'Spec helper spec'
    initial: initial
    except: [
      'assertion'
      'common.get_method'
      'common.parse_method_name'
      'common.unordered'
      'fs.require_safe_core'
      'fs.folder'
      'index'
      'matchers'
      'modular_wrapper'
      'spec.data'
      'spec.runner'
      'spec.syntax'
      'test.outputs'
      'test.tap'
      'test.tap_spec'
    ]
