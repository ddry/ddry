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
      matchers:
        index: 'Default matchers set'
        helpers: 'Default matchers helpers'
      modular:
        helpers: 'Modular spec parsing helpers'
        options: 'Modular spec options parsing'
        index: 'Modular spec parsing'
      spec:
        context: 'Method context constructor'
      test:
        engine: 'Test engine interface'
      spec_helper: 'Spec helper spec'
    initial:
      examples:
        instance: [ 'title', 'message' ]
      spec:
        context: [
          require './examples/code/lib/numbering'
          'ordinal'
            harness: 'tape'
            matchers: require '../lib/matchers'
            use: false
        ]
    only: [
      'code.index'
      'code.errors'
      'code.types'
      'common.object'
      'common.error_report'
      'common.harness'
      'common.parse_method_name'
      'examples.function_export'
      'examples.instance'
      'examples.numbering'
      'examples.properties'
      'fs.require_safe'
      'matchers.index'
      'matchers.helpers'
      'spec.context'
      'modular.helpers'
      'modular.options'
      'modular.index'
      'spec_helper'
      'test.engine'
    ]
