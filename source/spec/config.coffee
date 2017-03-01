'use strict'

run = require './run'
initial = require './initial'

module.exports = (harness, subject) ->
  run harness, subject,
    title: 'ddry by npm published version'
    moduleTitles:
      assertion:
        helpers: 'Assertion helpers'
        index: 'Assertion engine'
      code:
        instance:
          index: 'Instance code module processing core'
          initial: 'Instance code module initial data parsing'
        index: 'Code module processing core'
        errors: 'Code module processing error handling'
        types: 'Code module types processing'
      common:
        clone: 'Object cloning facility'
        dotted: 'Dotted name parser'
        error_report: 'Error reporter'
        harness: 'Harness detector'
        object:
          index: 'Commonly used object methods'
          report:
            index: 'Object report core'
            methods: 'Object report methods'
      examples:
        function_export: 'Function export example'
        instance: 'Instance example'
        numbering: 'Numbering example sequenced spec'
        properties: 'Module properties and hooks example spec'
        selenium: 'Selenium Webdriver example spec'
      fs:
        require_safe: 'Safe require wrapper'
      matchers:
        index: 'Default matchers set'
        helpers: 'Matchers helpers'
      modular:
        attach: 'Modular spec attachments processing'
        folders: 'Modular spec folders processing'
        helpers: 'Modular spec parsing helpers'
        index: 'Modular spec parsing'
        options: 'Modular spec options parsing'
      spec:
        context: 'Method context constructor'
      test:
        engine: 'Test engine interface'
      spec_helper: 'Spec helper spec'
    matchers: 'ddry-selenium-matchers'
    initial: initial
    use: 'examples.selenium'
    harness:
      tap:
        except: 'examples.selenium'
    except: [
      'fs.require_safe_core'
      'fs.folder'
      'fs.folder_core'
      'index'
      'matchers.index'
      'modular_wrapper'
      'modular.parse_path'
      'modular.spec_folder'
      'spec.data'
      'spec.runner'
      'spec.syntax'
      'test.outputs'
      'test.tap'
      'test.tap_spec'
    ]
