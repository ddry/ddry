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
        unordered: 'Unordered array elements set checker'
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
        folder_core: 'Folder reading core'
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
        spec_folder: 'Modular spec module spec folder processing'
      spec:
        context: 'Method context constructor'
        runner:
          detect: 'Spec runner syntax type detector'
        syntax: 'Data-driven spec syntax parsing'
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
      'index'
      'modular_wrapper'
      'spec.runner.data'
      'spec.runner.index'
      'spec.runner.params'
      'test.outputs'
      'test.tap'
      'test.tap_spec'
    ]
    # only: 'matchers.index'
  