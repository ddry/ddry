'use strict'

run_cli = require './run_cli'
initial = require './initial'

module.exports = (harness, subject) ->
  run_cli harness, subject,
    title: "#{subject} by #{harness}"
    matchers: 'ddry-selenium-matchers'
    initial: initial
    use: 'examples.selenium'
    harness:
      tap:
        except: 'examples.selenium'
    except: [
      'fs.require_safe_core'
      'fs.folder'
      'matchers.get_actual'
      'modular_wrapper'
      'spec.runner.index'
      'test.outputs'
      'test.tap'
      'test.tap_spec'
    ]
