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
        selenium: 'Selenium Webdriver example spec'
      fs:
        require_safe: 'Safe require wrapper'
      matchers:
        index: 'Default matchers set'
        helpers: 'Matchers helpers'
      modular:
        helpers: 'Modular spec parsing helpers'
        options: 'Modular spec options parsing'
        index: 'Modular spec parsing'
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
      'code.instance.initial'
      'common.clone'
      'common.unordered'
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
